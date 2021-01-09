Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#home'

  get '/about', to: 'static_pages#about'
  get '/new_entry', to: 'journals#new'
  post '/new_entry', to: 'journals#create'
  get 'my_entries', to: 'journals#index'
  get '/my_dashboard', to: 'dashboards#show'
  get '/my_calendar', to: 'meetings#index'
  get '/new_meeting', to: 'meetings#new'
  post '/new_meeting', to: 'meetings#create'

  resources :journals, only: [:show, :edit, :update] do
    resources :tags, only: [:create], module: :journals
  end

  resource :dashboard, only: [:new, :create, :destroy]
  resource :meetings, only: [:show]
end
