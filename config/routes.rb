Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'drinks#index'

  resources :home, only: %i[index]
  get 'drinks/recommendation', to: 'drinks#recommendation', as: 'drinks_recommendation'
end
