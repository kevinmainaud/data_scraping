require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage(url)

page = Nokogiri::HTML(open(url))

page.css("table.table:nth-child(1) > tbody:nth-child(3) > tr:nth-child(4) > td:nth-child(2)").text

end


def get_all_the_urls_of_val_doise_townhalls


    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

    links = page.css('.Style20 a')

    #emails_town95 : array of hashes
    emails_town95 = Array.new

    a = 0

    links.each do |i|
      page_url = i['href']
      page_url[0] = ""
      url = "http://annuaire-des-mairies.com" + page_url
      town_name = i.text

      url_hash = Hash.new
      url_hash[:name] = town_name
      url_hash[:email] = get_the_email_of_a_townhal_from_its_webpage(url)
      emails_town95[a] = url_hash

      a +=1

    end

puts emails_town95

end

get_all_the_urls_of_val_doise_townhalls
