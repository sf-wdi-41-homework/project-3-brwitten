Rails.application.routes.draw do
  root to: "twonouns#index"

  get "/twonouns", to: "twonouns#index", as: "twonouns"
  get "/magazine", to: "magazine#index", as: "magazine"
  get "/user", to: "user#index", as: "user"

  get "/parse_article" => "magazine#parse_article"
  get "/generate_pdf" => "magazine#generate_pdf"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

end
