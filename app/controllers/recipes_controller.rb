class RecipesController < ApplicationController
  load_and_authorize_resource only: %i[create destroy]
  before_action :authenticate_user!, only: %i[index create destroy]

  def index
    @recipes = Recipe.created_by_current_user(current_user)
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully Deleted.'
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attribute(:public, params[:recipe][:public])
      flash[:success] = 'Recipe visibility updated successfully.'
      redirect_to @recipe
    else
      flash.now[:error] = 'There was an error updating the recipe Visibility.'
      redirect_to @recipe
    end
  end

  def public_recipes
    @recipes = Recipe.public_recipes_ordered_by_newest
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :public, :preparation_time, :cooking_time)
  end
end
