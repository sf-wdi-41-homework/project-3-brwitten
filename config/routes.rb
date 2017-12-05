Rails.application.routes.draw do
  root "twonouns#index"

  get "/twonouns", to: "twonouns#index", as: "twonouns"


end
