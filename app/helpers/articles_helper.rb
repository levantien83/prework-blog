module ArticlesHelper
	def render_with_hashtags(text)
		text.gsub(/#\w+/){|word| link_to word, "/articles/hashtag/#{word.downcase.delete('#')}"}.html_safe
	end
end
