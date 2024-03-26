Rails.application.routes.draw do
  get 'auth/sign_in'
  post '/sign_in', to: 'auth#sign_in'
  devise_for :users
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql" if Rails.env.development?
  post "/graphql", to: "graphql#execute"
  post "/enquiries", to: "enquiries#create"
  post "/appointments", to: "appointments#create"
  resources :appointments
  resources :contact_infos
  resources :enquiries
  resources :registrations, only: [:create]
  get "up" => "rails/health#show", as: :rails_health_check
end
