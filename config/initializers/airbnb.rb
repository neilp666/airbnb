require 'open-uri'
require 'nokogiri'
require 'csv'

# Store URL to be scraped
url = "https://www.airbnb.co.uk/s/london"

# Parse the page with Nokogiri
page = Nokogiri::HTML(open(url))

# scrape the max number of pages and store in max_page variable
page_numbers = []
page.css("div.pagination ul li a[target]").each do |line|
  page_numbers << line.text
end

max_page = page_numbers.max

# Initialize empty arrays
name = []
price = []
details = []

# Loop once for evry page of search results
max_page.to_i.times do |i|

#open search results page
  url = "https://www.airbnb.co.uk/s/london?page=#{i+1}"
  page = Nokogiri::HTML(open(url))

#Store data in arrays.
  page.css('h3.h5.listing-name').each do |line|
   name << line.text.strip
end


page.css('span.h3.price-amount').each do |line|
  price << line.text
end


page.css('div.text-muted.listing-location.text-truncate').each do |line|
  details << line.text.strip.split(/ . /)
end

end


#write data to CSV file

#CSV.open("airbnb_listings.csv", "w") do |file|
  #file << ["Listing Name", "Price", "Details"]
  #name.length.times do |i|
    #file << [name[i], price[i], details[i]]
  #end
#end
