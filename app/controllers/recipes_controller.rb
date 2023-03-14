class RecipesController < ApplicationController
    before_action :authenticate_user!, only: [:index, :create, :destroy]

    def index
        @recipes = Recipe.created_by_current_user(current_user)
    end

    def show
        
    end

    def create
        #
    end

    def destroy
        #
    end

    def public_recipes
        @recipes = Recipe.public_recipes_ordered_by_newest
    end

    def recipe_params
        params.require(:recipe).permit(:name, :description, :public, :preparation_time, :cooking_time)
    end
end
