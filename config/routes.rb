Rails.application.routes.draw do
  resources :user_boards
  resources :users
  resources :cards
  resources :lists
  resources :boards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
