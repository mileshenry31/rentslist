Rails.application.routes.draw do
  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end
  resources :items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/search_item', to: 'search#search_item'
  get '/settings', to: 'settings#index', as: :settings
  get '/locations/new', to: 'settings#new_location', as: :new_location
  get '/location', to: 'settings#new_location', as: :locations
  post '/location', to: 'settings#create_location'
  get '/cards/new', to: 'settings#new_card', as: :cards
  post '/cards/new', to: 'settings#create_card'
  post '/defaultlocation/set/:location_id', to: 'settings#make_default_location', as: :make_default_location
  get '/lease/new/:item_id', to: 'lease#new', as: :new_lease
  post '/leases', to: 'lease#create', as: :create_lease
  get '/leases', to: 'lease#index', as: :leases
  delete '/location/:id/delete', to: 'settings#delete_location', as: :delete_location
  root "items#index"
  resources :leases
end
