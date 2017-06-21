Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'profile', to: 'profile#show'
  jsonapi_resources :decks do
    jsonapi_relationships
    jsonapi_resources :cards
  end
  jsonapi_resources :cards
  jsonapi_resources :users do
    jsonapi_relationships
    jsonapi_resources :decks
  end
  jsonapi_resources :profiles

  jsonapi_resources :trainings do
    jsonapi_relationships
  end

  post :signin, controller: :authentication, action: :sign_in

  root to: 'home#base'
end
