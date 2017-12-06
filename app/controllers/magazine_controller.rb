require 'httparty'

class MagazineController < ApplicationController


  def parse_article
     token = ENV["DIFFBOT_TOKEN"]
     url = params[:search]
     response = HTTParty.get "https://api.diffbot.com/v3/analyze?token=#{token}&url=#{url}"
     @response = response
     @title = response["objects"][0]["title"]
     @author = response["objects"][0]["author"]
     @source = response["objects"][0]["siteName"]
     @url = response["request"]["pageUrl"]
     @date = response["objects"][0]["date"]
     @text = response["objects"][0]["text"]

     render('user/index.html.erb')
  end

end
