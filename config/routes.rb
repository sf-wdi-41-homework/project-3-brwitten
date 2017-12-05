Rails.application.routes.draw do
  root "twonouns#index"

  get "/twonouns", to: "twonouns#index", as: "twonouns"
  get "/magazine", to: "magazine#index", as: "magazine"
  get "/user", to: "user#index", as: "user"
  get "/parse_article" => "magazine#parse_article"


end
