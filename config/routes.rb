Rails.application.routes.draw do
  resources :contacts

  resources :fairs

  devise_for :users
  root to: "dashboard#index"
end
