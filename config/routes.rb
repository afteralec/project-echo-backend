Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'echos/seed', to: 'echos#seed'
      get '/listen/:id', to: 'users#listen'
      get '/unlisten/:id', to: 'users#unlisten'

      get 'echos/listen/:id', to: 'echos#listen'
      get 'echos/unlisten/:id', to: 'echos#unlisten'

      resources :users, only: [ :index, :show, :update ]
      resources :echos, only: [ :show, :create ]
    end
  end

  post '/login', to: 'sessions#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
