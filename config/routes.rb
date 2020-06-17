Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"

  get '/dashboard', to: 'dashboard#show'

  resources :reminders, only: [:new, :create, :index, :show]
  resources :users, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
