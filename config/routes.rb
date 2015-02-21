Rails.application.routes.draw do
  resources :messages

  resources :contacts

  resources :fairs

  devise_for :users
  root to: "dashboard#index"
end
