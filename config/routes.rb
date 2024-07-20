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
end
