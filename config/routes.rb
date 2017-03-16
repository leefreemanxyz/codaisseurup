Rails.application.routes.draw do
  resources :categories
  root to: 'pages#home'
  get '/about' => "pages#about"
  devise_for :users
  resources :users, only: [:show]
  resources :events
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :photos
end
