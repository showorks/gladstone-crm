Rails.application.routes.draw do
  resources :fairs

  devise_for :users
  root to: "dashboard#index"
end
