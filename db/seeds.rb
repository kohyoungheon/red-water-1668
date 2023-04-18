# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@chef_1 = Chef.create!(name: "Gordon Ramsay")
@chef_2 = Chef.create!(name: "Georges St. Pierre")

@dish_1 = @chef_1.dishes.create!(name: "Steak", description: "A delicious steak")
@dish_2 = @chef_1.dishes.create!(name: "Rissoto", description: "A delicious rissoto")
@dish_3 = @chef_2.dishes.create!(name: "Lobster", description: "A delicious lobster")

@ingredient_1 = Ingredient.create!(name: "Beef", calories: 100)
@ingredient_2 = Ingredient.create!(name: "Asparagus", calories: 20)
@ingredient_3 = Ingredient.create!(name: "Rice", calories: 70)
@ingredient_4 = Ingredient.create!(name: "Mushroom", calories: 50)
@ingredient_5 = Ingredient.create!(name: "Lobster Tail", calories: 120)
@ingredient_6 = Ingredient.create!(name: "Butter", calories: 150)
@ingredient_7 = Ingredient.create!(name: "Lemon", calories: 10)

@dish_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
@dish_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
@dish_ingredient_3 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_3.id)
@dish_ingredient_4 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_4.id)
@dish_ingredient_5 = DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_5.id)
@dish_ingredient_6 = DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_6.id)
@dish_ingredient_6 = DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_7.id)