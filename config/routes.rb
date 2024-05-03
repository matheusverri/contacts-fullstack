Rails.application.routes.draw do
  resources :contacts
  get 'password_resets/new'
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
  get 'signup', to: 'users#new', as: 'signup'
  get 'delete', to: 'users#delete', as: 'delete_users'
  post 'destroy', to: 'users#destroy', as: 'destroy_users'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get '/password/reset', to: 'password_resets#new'
  post '/password/reset', to: 'password_resets#create'
  get '/password/reset/edit', to: 'password_resets#edit'
  patch '/password/reset/edit', to: 'password_resets#update'
  
  resources :users
  resources :sessions

  root 'contacts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
