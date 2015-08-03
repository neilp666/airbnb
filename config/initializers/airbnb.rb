require 'open-uri'
require 'nokogiri'
require 'csv'

# Store URL to be scraped
url = "https://www.airbnb.co.uk/s/london"

# Parse the page with Nokogiri
page = Nokogiri::HTML(open(url))


#Store data in arrays.

name =[]
page.css('h3.h5.listing-name').each do |line|
  name << line.text
end

price =[]
page.css('span.h3.price-amount').each do |line|
  price << line.text
end

details =[]
page.css('div.text-muted.listing-location.text-truncate').each do |line|
  details << line.text
end


#write data to CSV file

CSV.open("airbnb_listings.csv", "w") do |file|
  file << ["Listing Name", "Price", "Details"]
  name.length.times do |i|
    file << [name[i], price[i], details[i]]
  end
end
