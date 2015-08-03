require 'open-uri'
require 'nokogiri'

# Store URL to be scraped
url = "https://www.airbnb.co.uk/s/london"

# Parse the page with Nokogiri
page = Nokogiri::HTML(open(url))

# Display output onto the screen
page.css('h3.h5.listing-name').each do |line|
  puts line.text
end

page.css('span.h3.price-amount').each do |line|
  puts line.text
end

page.css('div.text-muted.listing-location.text-truncate').each do |line|
  puts line.text
end
