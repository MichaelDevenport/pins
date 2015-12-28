class Scrape_m6
	attr_accessor :title, :description, :link, :failure

	def scrape_new_pin(url_3)
		begin
			doc = Nokogiri::HTML(open(url_3))

			doc.css('script').remove
			self.title = doc.css('.posthead').css("span.postdate").text
			self.description = doc.css("font:nth-child(2)").text
			self.link = doc.css('#5throw').css("a#dm6")[0]['href']

			return true
		rescue Exception => e
			self.failure = "Something went wrong with the scrape"
		end
	end
end