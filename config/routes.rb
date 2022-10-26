Rails.application.routes.draw do 

  root 'home#index' 
  devise_for :users

  devise_scope :user do
    get '/users' =>  'devise/registrations#new'
  end
end
