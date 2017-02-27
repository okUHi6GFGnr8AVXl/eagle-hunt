Rails.application.routes.draw do
  resources :furnitaures
  resources :furnitaure_wages
  resources :furniture_details
  resources :profiles
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
