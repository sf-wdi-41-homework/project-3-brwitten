require 'httparty'

class MagazineController < ApplicationController

  def parse_article
     token = "bb383b3d967eeea80833c684c7d67164"
     url = params[:search]
     response = HTTParty.get "https://api.diffbot.com/v3/analyze?token=#{token}&url=#{url}"
     @response = response
     puts "THIS IS YOUR RESPONSE"
     puts response
     render('user/index.html.erb')
  end

end
