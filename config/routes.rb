Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [ :index, :show ]
      resources :echos, only: [ :show, :create]
      get '/listen/:id', to: 'users#listen'
      get '/unlisten/:id', to: 'users#unlisten'
    end
  end

  post '/login', to: 'sessions#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
