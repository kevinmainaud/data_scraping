require 'rubygems'
require 'nokogiri'
require 'open-uri'


def incubateurs_listing

  page = Nokogiri::HTML(open("http://www.mon-incubateur.com/site_incubateur/incubateurs"))

  incubateurs = page.css('#incubators_list span a').text

  zip_codes = page.css('#incubators_list a').text

  list = Hash.new

  list.merge!(incubateur: incubateurs, zip_code: zip_codes)

  puts list

end

incubateurs_listing
