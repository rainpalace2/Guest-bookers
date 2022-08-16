Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top'
  get "about" => "homes#about", as: "about"
  
  resources :books,only: [:new,:index,:show,:create]
  resources :users,only: [:show,:edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users,controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
