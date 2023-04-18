class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.all_possible_ingredients(dish)
    where.not(id: dish.ingredients.pluck(:id))
  end
end