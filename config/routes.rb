Rails.application.routes.draw do
  get 'items/index'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :new, :create]
  end
end