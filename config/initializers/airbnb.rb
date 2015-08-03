require 'open-uri'
require 'nokogiri'

# Store URL to be scraped
url = "https://www.airbnb.co.uk/s/london"

# Parse the page with Nokogiri
page = Nokogiri::HTML(open(url))

# Display output onto the screen
puts page
