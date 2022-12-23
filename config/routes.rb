Rails.application.routes.draw do

  get 'search' => 'search#index'
  resources :pages
  
  resources :rooms do
    resources :messages
  end

  root "home#index"
  
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users, only: [:show]

  devise_scope :user do
    get "users" => "devise/sessions#new"
  end

end
