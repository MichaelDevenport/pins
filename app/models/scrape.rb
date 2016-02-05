class Scrape

	attr_accessor :tag_list, :title, :description, :failure

	def scrape_new_pin(url)
		begin
			doc = Nokogiri::HTML(open(url).read, nil, 'utf-8')

			doc.css('script').remove
			self.tag_list = doc.css('#watch7-user-header .spf-link').text.strip
			self.title = doc.css('#eow-title , .html5-main-video').text.strip
			self.description = doc.css('#eow-description').text.strip

			return true
		rescue Exception => e
			self.failure = "Something went wrong with the scrape"
		end
	end
end





# doc = Nokogiri::HTML(open("url").read, nil, 'utf-8')
#
# tag_parse = doc.css('#watch7-user-header .spf-link').text
# tag = tag_parse.strip
#
# title_parse = doc.css('#eow-title , .html5-main-video').text
# title = title_parse.strip

# description_parse = doc.css('#eow-description').text
# description = description_parse



