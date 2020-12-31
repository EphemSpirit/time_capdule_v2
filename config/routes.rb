Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get '/about', to: 'statice_pages#about'
end
