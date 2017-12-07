class UserController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/article_list'
    else
      redirect_to '/signup'
    end
  end

  def index
    if current_user == nil
      redirect_to('/')
    else
      @my_magazines = Magazine.where(user_id:current_user.id)
    end
  end

  def generate_pdf
    @my_articles = UserArticle.where(user_id:current_user.id)
    @article_list = []
    @my_articles.each do |article|
      @article_list << Article.find(article.article_id)
    end
    pdf = Prawn::Document.new
    pdf.text "Your Two Nouns Magazine", :size => 50
    pdf.text "Created by #{current_user.name}"
    pdf.start_new_page
    @article_list.each do |article|
      pdf.text "Article Title: #{article.title}"
      pdf.text "Article Author: #{article.author}"
      pdf.text "#{article.text}"
      pdf.start_new_page
    end
    pdf.text "Woohoo, you made it to the end!", :size => 25
    send_data pdf.render
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
