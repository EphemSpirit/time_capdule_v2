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

  get '/my_photos', to: 'photos#index'
  get '/new_photo', to: 'photos#new'
  post '/new_photo', to: 'photos#create'

  resources :journals, only: [:show, :edit, :update] do
    resources :tags, module: :journals
  end

  resources :photos, only: [:show, :edit, :update]

  resource :dashboard, only: [:new, :create, :destroy]
  resource :meetings, only: [:show]
end
