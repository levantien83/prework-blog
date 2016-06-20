class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :body, presence: true
	def self.search(search)
		if search
			where(["lower(title) LIKE ?" , "%#{search.downcase}%"])
		else
			all
		end
	end
	is_impressionable
end
