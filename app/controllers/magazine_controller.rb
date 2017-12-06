require 'httparty'

class MagazineController < ApplicationController

  def parse_article
     token = ENV["DIFFBOT_TOKEN"]
     url = params[:search]
     response = HTTParty.get "https://api.diffbot.com/v3/analyze?token=#{token}&url=#{url}"
     @response = response
     puts @response
     # response length is a hacky way to know if there was an error in processing the URL
     if response.length == 2
       flash[:notice] = 'Error in processing that URL...'
       redirect_to('/magazine')
     else
       @title = response["objects"][0]["title"] || "No title"
       @author = response["objects"][0]["author"]
       @source = response["objects"][0]["siteName"]
       @url = response["request"]["pageUrl"]
       @date = response["objects"][0]["date"]
       @text = response["objects"][0]["text"]
       render('user/index.html.erb')
     end
  end

  def generate_pdf
    pdf = Prawn::Document.new
    pdf.text "Your response #{@response}"
    send_data pdf.render
  end

end
