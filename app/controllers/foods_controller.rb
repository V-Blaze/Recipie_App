class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.includes(:foods).find(current_user.id)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to foods_path
    else
      render 'new'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: 'Food was successfully deleted.'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity).merge(user: current_user)
  end
end
