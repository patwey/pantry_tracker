Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/dashboard', to: 'users#show'

  get '/pantry', to: 'user_ingredients#index'

  resources :user_ingredients, only: [:new, :create]
end
