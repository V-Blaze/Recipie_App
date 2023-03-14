Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'public_recipes', to: 'recipes#public_recipes'
  resources :recipes, only: [:index, :show, :create, :destroy]

  # Defines the root path route ("/")
  # root "articles#index"
end
