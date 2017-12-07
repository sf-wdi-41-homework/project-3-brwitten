Rails.application.routes.draw do
  root to: "twonouns#index"

  get "/twonouns" => "twonouns#index"

  get "/user" => "user#index"
  get "/generate_pdf" => "user#generate_pdf"
  get '/signup' => 'user#new'
  post '/signup' => 'user#create'

  get "/publish" => "magazine#publish"
  get "/magazine" => "magazine#index"
  get "/article_list" => "magazine#article_list"
  get "/parse_article" => "magazine#parse_article"
  get "/save_magazine" => "magazine#save_magazine"
  delete "delete/:id" => "magazine#delete_article"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
