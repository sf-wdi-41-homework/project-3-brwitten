class UserController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/article_list'
      UserMailer.welcome_email(@user).deliver_now
    else
      redirect_to '/signup'
    end
  end

  def index
    if current_user == nil
      redirect_to('/')
    else
      @my_magazines = Magazine.where(user_id:current_user.id).order(created_at: :desc)
    end
  end

  def generate_pdf
    @mag_id = "#{params["mag_id"]}"
    @mag_articles = ArticleMagazine.where(magazine_id:@mag_id)
    # take magazine id and look up all articles in that magazine in Article Magazine table
    @article_info = []
    @mag_articles.each do |article|
      @article_info << Article.find(article.article_id)
    end
    pdf = Prawn::Document.new
    pdf.text "Your Two Nouns Magazine", :size => 50
    pdf.text "Created by #{current_user.name}"
    pdf.start_new_page
    @article_info.each do |article|
      pdf.text "Article Title: #{article.title}"
      pdf.text "Article Author: #{article.author}"
      pdf.text "#{article.text}"
      pdf.start_new_page
    end
    pdf.text "Woohoo, you made it to the end!", :size => 25
    send_data pdf.render
  end

  def delete_magazine
    @mag_id = "#{params["mag_id"]}"
    @delete_articles = ArticleMagazine.where(magazine_id:@mag_id).pluck(:article_id)
    ArticleMagazine.where(magazine_id:@mag_id).destroy_all
    Magazine.where(id:@mag_id).destroy_all
    @delete_articles.each do |article|
      Article.where(id:article).destroy_all
    end
    redirect_to('/user')
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
