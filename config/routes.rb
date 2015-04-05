Rails.application.routes.draw do

  resources :fairs do
    resources :messages
    resources :contacts
    collection do
      get :autocomplete_fairs
      get :search, via: [:get, :post]
    end
  end

  devise_for :users
  resources :users

  root to: "dashboard#index"
end
