require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'

page = Nokogiri::HTML(open"http://en.wikipedia.org/", :allow_redirections => :safe)
puts page.class
