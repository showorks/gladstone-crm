Rails.application.routes.draw do
  resources :messages

  resources :contacts

  resources :fairs do
    collection do
      get :autocomplete_fairs
      get :search, via: [:get, :post]
    end
  end

  devise_for :users
  root to: "dashboard#index"
end
