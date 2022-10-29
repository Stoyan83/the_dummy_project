Rails.application.routes.draw do 
  resources :pages

  root 'home#index' 
  devise_for :users
  resources :users , only: [:show] 
  devise_scope :user do
    get '/users' =>  'devise/registrations#new'
  end
end
