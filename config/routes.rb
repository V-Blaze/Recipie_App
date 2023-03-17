Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'shopping_list/:recipe_id', to: 'recipes#shopping_list'
  get 'public_recipes', to: 'recipes#public_recipes'

  get 'recipe_foods/:recipe_id', to: 'recipe_foods#new'
  post 'recipe_foods/:recipe_id', to: 'recipe_foods#create'
  resources :recipe_foods, only: [:update, :edit, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :update, :destroy]
  resources :foods, only: [:index, :new, :create, :destroy]

  # Defines the root path route ("/")
  root "home#index"
end
