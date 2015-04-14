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

  get '/files', to: "files#index", as: 'files'
  get '/files/changes', to: "files#changes", as: 'changes_files'
  get '/files/import', to: "files#import", as: 'import_files'
  root to: "fairs#search"
end
