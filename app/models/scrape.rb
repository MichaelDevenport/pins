class Scrape

	attr_accessor :tag_list, :title, :description, :yt_uid, :failure

	def yt_scrape(pin_url)
		begin
			doc = Nokogiri::HTML(open(pin_url).read, nil, 'utf-8')

			doc.css('script').remove
			self.tag_list = doc.css('#watch7-user-header .spf-link').text.strip
			self.title = doc.css('#eow-title , .html5-main-video').text.strip
			self.description = doc.css('#eow-description').text.strip
			self.yt_uid = doc.css('#watch7-content link')[0]['href']

			return true
		rescue Exception => e
			self.failure = "OOP's its all gone wrong!"
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



