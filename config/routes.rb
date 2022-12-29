Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  # resources :users, except: [:new]
  # post "/signup", to: "users#create"
  resources :singers
  post "/singer/signup", to:"singers#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
