require 'rubygems'
require 'nokogiri'
require 'open-uri'


def crypto_pricing


    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

    cryptocurrency = page.css(".currency-name-container").map {|x| x.content}

    prices = page.css("a.price").map {|x| x.content}

    #crypto_listing : array of hashes

      a= 0
      crypto_listing = Array.new


  while a<cryptocurrency.length

      myhash = Hash.new
      myhash[:cryptocurrency] = cryptocurrency[a]
      myhash[:prices] = prices[a]

      crypto_listing[a] = myhash

      a+=1

    end

    puts crypto_listing
end

def price_update

  j = 0

  while j<1

    crypto_pricing

    sleep(3600)
  end

end

price_update
