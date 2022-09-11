Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get "home/about" => "homes#about", as: "about"

  resources :books,only: [:new,:create,:index,:show,:destroy,:edit,:update]
  resources :users,only: [:show,:edit,:index,:new,:update,:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users_guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
