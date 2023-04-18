class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  def update
    @dish = Dish.find(params[:id])
    DishIngredient.create!(dish_id: @dish.id, ingredient_id: params[:dish][:ingredient])
    redirect_to dish_path(@dish)
  end

end