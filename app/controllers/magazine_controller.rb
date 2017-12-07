require 'httparty'
require 'prawn'
require 'open-uri'

class MagazineController < ApplicationController

  before_action :authorize

  def article_list
    @my_articles = UserArticle.where(user_id:current_user.id)
    @article_list = []
    @my_articles.each do |article|
      @article_list << Article.find(article.article_id)
    end
  end

  def parse_article
     token = ENV["DIFFBOT_TOKEN"]
     input_url = params[:search]
     url = URI::encode(input_url)
     response = HTTParty.get "https://api.diffbot.com/v3/analyze?token=#{token}&url=#{url}"
     @response = response
     puts @response
     # response length is a hacky way to know if there was an error in processing the URL
     if response.length <= 2
       flash[:notice] = 'Error in processing that URL...'
       redirect_to('/magazine')
     else
       @title = response["objects"][0]["title"] || "No title"
       @author = response["objects"][0]["author"]
       @source = response["objects"][0]["siteName"]
       @url = response["request"]["pageUrl"]
       @date = response["objects"][0]["date"]
       @text = response["objects"][0]["text"]
       new_article = Article.create_with(url:@url, title:@title, author:@author, published:@date, text:@text).find_or_create_by(title:@title)
       current_user.articles << new_article
       redirect_to('/article_list')
     end
  end

  def generate_pdf
    @my_articles = UserArticle.where(user_id:current_user.id)
    @article_list = []
    @my_articles.each do |article|
      @article_list << Article.find(article.article_id)
    end
    @to_print = []
    @article_list.each do |article|
      @to_print << article.title
      @to_print << article.author
      @to_print << article.text
    end
    pdf = Prawn::Document.new
    pdf.text "#{@to_print}"
    send_data pdf.render
  end

  def delete_article
    puts "#{params}"
    puts "ARTICLE TITLE #{params["article_title"]}"
    puts "CURRENT USER #{current_user.id}"
    article_id = Article.where(id:"#{params["id"]}").pluck(:id)
    to_delete = UserArticle.where(user_id:current_user.id,article_id:article_id)
    to_delete.destroy_all
    redirect_to('/article_list')
  end

end
