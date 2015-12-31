class Scrape_m3
	attr_accessor :title, :description, :link, :failure

	def scrape_new_pin(url_1)
		begin
			doc = Nokogiri::HTML(open(url_1))

			doc.css('script').remove
			self.title = doc.css('.posthead').css("span.postdate").text
			self.description = doc.css("font:nth-child(2)").text
			self.link = doc.css('#5throw').css("a#dm3")[0]['href']

			return true
		rescue Exception => e
		 	self.failure = 'Something went wrong with the scrape'
		end
	end
end
