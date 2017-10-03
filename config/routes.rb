Rails.application.routes.draw do
  resources :gift_givers
  resources :events do
    resources :gifts do
      put 'thank', to: 'gifts#thank'
    end
  end
  resources :givers


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#welcome'


end
