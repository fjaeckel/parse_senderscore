#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

vhosts = { 
  "example.com" => [ "127.0.0.1", "23.42.23.1"]
}

url = "https://www.senderscore.org/lookup.php?lookup="

vhosts.each do |vhost|
  vhosts[vhost.first].each do |ip|
    doc = Nokogiri::HTML(open(url + ip))
    
    doc.css('div#senderscore_number').each do |link|
      puts ip.to_s + " " + link.content
    end
  end
end
