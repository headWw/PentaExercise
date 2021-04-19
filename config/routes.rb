Rails.application.routes.draw do
  resources :groceries
  devise_for :models
  root to: 'pages#home'
  devise_for :views
  devise_for :users
  get 'groceries/index'
  # root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
