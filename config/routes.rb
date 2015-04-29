Rails.application.routes.draw do

  resources :fairs do
    get :search, via: [:get, :post], on: :collection
    resources :messages
    resources :contacts
  end

  devise_for :users
  resources :users

  get '/files', to: "files#index", as: 'files'
  get '/files/changes', to: "files#changes", as: 'changes_files'
  get '/files/import', to: "files#import", as: 'import_files'
  root to: "fairs#search"
end
