class RecipeFoodsController < ApplicationController
    before_action :authenticate_user!, only: %i[new create]

    def new
        @recipes_foods  = RecipeFood.new
        @recipe_id = params[:recipe_id]
        @foods = current_user.foods

    end

    def create
        @recipe_food = RecipeFood.new
        @recipe_food.recipe_id = params[:recipe_id]
        @recipe_food.food_id = params[:food_id]
        @recipe_food.quantity = params[:quantity]

        if @recipe_food.save
            redirect_to recipe_path(params[:recipe_id]), notice: 'Recipe food was created successfully'
        else
            render 'new'
        end

    end

    def edit
        @recipe_food  = RecipeFood.find_by(id: params[:id])
        @foods = current_user.foods
    end

    def update
        @recipe_food = RecipeFood.find_by(recipe_id: params[:id])

        if @recipe_food.update(food_id: params[:food_id], quantity: params[:quantity])
            redirect_to recipe_path(params[:id]), notice: 'Recipe food was Updated successfully'
        else
            render :edit, notice: 'You recipe was not updated'
        end
    end

    def destroy
        @recipe_food = RecipeFood.find_by(id: params[:id])
        @recipe_food.destroy
            redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Recipe food was Deleted successfully'
    end
end
