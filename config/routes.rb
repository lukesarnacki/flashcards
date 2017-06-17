Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'profile', to: 'profile#show'
  jsonapi_resources :decks do
    jsonapi_resources :cards
  end
  jsonapi_resources :cards
  jsonapi_resources :users
  jsonapi_resources :profiles

  post :signin, controller: :authentication, action: :signin

  root to: 'home#base'
end
