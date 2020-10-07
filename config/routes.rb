Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"

  get '/dashboard', to: 'dashboard#show'

  resources :reminders, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:new, :create, :destroy] do
      resources :profile, only: [:new, :create, :edit, :update]
      resources :security_questions
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/register', to: 'users#new'
  get '/logout', to: 'sessions#destroy'

  get '/forgot', to: 'sessions#index'
  post '/forgot', to: 'security_questions#show'
  patch '/forgot/:id', to: 'sessions#update'

  get '/password_reset/:id', to: 'pass#edit'
  patch '/password_reset/:id', to: 'pass#update'
end
