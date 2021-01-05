Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get '/about', to: 'statice_pages#about'
  get '/new_entry', to: 'journals#new'
  post '/new_entry', to: 'journals#create'
  get 'my_entries', to: 'journals#index'
  resources :journals, only: [:show] do
    resources :tags, only: [:new, :create]
  end
  resource :dashboard, only: [:new, :create, :show, :destroy]
end
