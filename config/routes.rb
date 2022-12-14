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
  get "videos/public", to:"videos#show_public_videos"
  post "videos/:id/thumbnails", to:"videos#update_thumbnails"
  resources :videos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
