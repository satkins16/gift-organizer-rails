Rails.application.routes.draw do
  resources :gift_givers
  resources :givers
  resources :events do
    patch 'thank', to: 'gifts#thank'
    resources :gifts do
    end
  end




  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#welcome'


end
