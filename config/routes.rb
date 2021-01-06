Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get '/about', to: 'statice_pages#about'
  get '/new_entry', to: 'journals#new'
  post '/new_entry', to: 'journals#create'
  get 'my_entries', to: 'journals#index'
  get '/my_dashboard', to: 'dashboards#show'

  resources :journals, only: [:show, :edit] do
    resources :tags, only: [:create], module: :journals
  end

  resource :dashboard, only: [:new, :create, :destroy]
end
