Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  get "/profiles/:id", to: "profiles#show", as: 'profile'
  get "/profile", to: "profiles#me", as: 'me'
  resources :posts do
    resources :comments, only: [:create]
  end

end
