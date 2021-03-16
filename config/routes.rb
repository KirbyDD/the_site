Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"

  get '/dashboard', to: 'dashboard#show'

  get '/forum', to: 'board#index'
  get '/forum/:abbre', to: 'board#show'


  resources :reminders, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:new, :create, :edit, :destroy] do
      resources :profile, only: [:new, :create, :edit, :update]
      resources :security_questions
  end
  patch '/users/:id', to: 'users#update'
  get '/users/:id/profile/edit', to: "profile#edit"

  namespace :admin do
    get '/', to: 'dashboard#index'
    patch '/set_users', to: 'dashboard#update'
    get '/forum/new', to: 'board#new'
    post '/forum', to: 'board#create'
    delete '/forum/:abbre', to: 'board#destroy'
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
