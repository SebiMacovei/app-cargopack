Rails.application.routes.draw do
  devise_for :users,
  path: '',
    path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
    controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Defines the root path route ("/")
  get "/users", to: "users#index"
  post "/users", to: "users#create"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"
  get "/users/:id", to: "users#find_by_id"

  resources :expenses, only:[:index, :update, :create, :destroy]
  resources :trips, only:[:index, :update, :create, :destroy]
  resources :packages, only:[:index, :update, :create, :destroy]
  resources :clients, only:[:index, :update, :create, :destroy]
  resources :cars, only:[:index, :update, :create, :destroy]
  resources :extensions, only:[:index, :update, :create, :destroy]
  get "/expenses/:id", to: "expenses#find_by_id"
  get "/trips/:id", to: "trips#find_by_id"
  get "/packages/:id", to: "packages#find_by_id"
  get "/clients/:id", to: "clients#find_by_id"
  get "/cars/:id", to: "cars#find_by_id"
  get "/extensions/:id", to: "extensions#find_by_id"
  get "/current-user", to: "users#get_current_user"
  get "/current-trips", to: "trips#current_trips"
end
