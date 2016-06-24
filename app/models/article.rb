class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_and_belongs_to_many :tags
	belongs_to :user

	validates :title, presence: true
	validates :body, presence: true

	is_impressionable

	after_create do
		hashtags = self.body.scan(/#\w+/)
		hashtags.map!(&:downcase)		
		hashtags.uniq.map do |hashtag|
			tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
			self.tags << tag
		end
	end

	after_update do
		self.tags.clear
		hashtags = self.body.scan(/#\w+/)
		hashtags.map!(&:downcase)
		hashtags.uniq.map do |hashtag|
			tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
			self.tags << tag
		end
	end

	def self.search(search)
		if search
			where(["lower(title) LIKE ?" , "%#{search.downcase}%"])
		else
			all
		end
	end


end
