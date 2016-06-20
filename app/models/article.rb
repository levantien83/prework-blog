class Article < ActiveRecord::Base
	def self.search(search)
		if search
			where(["lower(title) LIKE ?" , "%#{search.downcase}%"])
		else
			all
		end
	end
	is_impressionable
end
