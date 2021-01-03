Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get '/about', to: 'statice_pages#about'
  get '/new_entry', to: 'journals#new'
  get 'my_entries', to: 'journals#index'
  resources :journals, only: [:show]
  resource :dashboard, only: [:new, :create, :show, :destroy]
end
