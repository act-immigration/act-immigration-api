Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql" if Rails.env.development?
  post "/graphql", to: "graphql#execute"
  post "/enquiries", to: "enquiries#create"
  post "/appointments", to: "appointments#create"
  post '/upload', to: 'enquiries#upload'
  # post '/upload/', to: 'documents#upload'
  get '/enquiries_by_email/:email', to: 'enquiries#by_email', constraints: { email: %r{[^/]+} }
  get '/appointments_by_email/:email', to: 'appointments#by_email', constraints: { email: %r{[^/]+} }
  get '/enquiries/documents/:email', to: 'enquiries#enquiry_with_documents', as: 'enquiry_documents'
  get '/documents_by_email/:email', to: 'documents#documents_by_email', constraints: { email: %r{[^/]+} }
  get '/profile/:email', to: 'users#show_profile', constraints: { email: %r{[^/]+} }
  resources :profiles
  resources :users
  resources :appointments
  resources :contact_infos
  resources :enquiries
  resources :documents, only: [:index]
  resources :registrations, only: [:create]
  get "up" => "rails/health#show", as: :rails_health_check
end
