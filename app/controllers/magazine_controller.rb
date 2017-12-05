require 'readability'
require 'open-uri'


# doc = Nokogiri::HTML(open("https://www.nytimes.com/2017/12/05/us/politics/supreme-court-same-sex-marriage-cake.html"))
# @parsed = doc.css("p[class='story-body-text story-content']").text
# puts @parsed


source = open('https://www.nytimes.com/2017/12/05/us/politics/supreme-court-same-sex-marriage-cake.html').read
puts Readability::Document.new(source).content



# @parsed.each do |text|
#   puts text
# end


class MagazineController < ApplicationController

end
