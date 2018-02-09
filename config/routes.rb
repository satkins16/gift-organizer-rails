Rails.application.routes.draw do
  resources :gift_givers
  resources :givers
  resources :events do
    resources :gifts do
      patch 'thank'
    end
  end

  get 'users', to: 'application#users_index'

  get '/gifts/:id/thank', to: 'gifts#thank'


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#welcome'


end
