Rails.application.routes.draw do
  root to: "twonouns#index"

  get "/twonouns" => "twonouns#index"
  get "/magazine" => "magazine#index"
  get "/user" => "user#index"

  get "/parse_article" => "magazine#parse_article"
  get "/generate_pdf" => "magazine#generate_pdf"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'user#new'
  post '/user' => 'user#create'

end
