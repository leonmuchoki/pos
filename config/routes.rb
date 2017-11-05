Rails.application.routes.draw do
  
  resources :menus do 
    resources :foods
    resources :drinks
  end

  resources :orders

  resources :reports

  namespace :api do
    resources :orders
  end

  root "welcome#index"

  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
