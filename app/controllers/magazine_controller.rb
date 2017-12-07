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
    # response length is a hacky way to know if there was an error in processing the URL
    if response.length <= 2
      flash[:notice] = 'Error in processing that URL...'
      redirect_to('/article_list')
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

# not currently using this method -- need to add and separte out save and download
  def save_magazine
    new_mag = Magazine.create(name:DateTime.now,user_id:current_user.id)
    @my_articles = UserArticle.where(user_id:current_user.id)
    @article_list = []
    @my_articles.each do |article|
      new_mag.articles << Article.find(article.article_id)
    end
    redirect_to('/user')
  end

  def delete_article
    article_id = Article.where(id:"#{params["id"]}").pluck(:id)
    to_delete = UserArticle.where(user_id:current_user.id,article_id:article_id)
    to_delete.destroy_all
    redirect_to('/article_list')
  end

  def publish
    @my_articles = UserArticle.where(user_id:current_user.id)
    @article_list = []
    @my_articles.each do |article|
      @article_list << Article.find(article.article_id)
    end
  end

end
