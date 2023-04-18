require 'rails_helper'

RSpec.describe 'Dish Show Page', type: :feature do
  before(:each) do
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
  end

  describe "dish's show page (User Story 1) " do
    it "displays the name, description, ingredients, total calories, and chefs name for dish" do
      visit dish_path(@dish_1)
      within ("#main_info") do
        expect(page).to have_content("Name: Steak")
        expect(page).to have_content("Description: A delicious steak")
        expect(page).to have_content("Ingredients:\nBeef Asparagus")
        expect(page).to have_content("Total Calories: 120")
        expect(page).to have_content("Chef's Name: Gordon Ramsay")
  
        expect(page).to_not have_content("Rissoto")
        expect(page).to_not have_content("Lobster")
        expect(page).to_not have_content("A delicious rissoto")
        expect(page).to_not have_content("A delicious lobster")
      end
    end
  end

  describe "dish's show page (User Story 2) " do
    it "displays a form to add an existing ingredient to the dish" do
      visit dish_path(@dish_1)
      within ("#ingredient_form") do
        expect(page).to have_selector("#dish_ingredient")
        expect(page).to have_button("Add an Ingredient")
      end
    end
    it "when I pick an ingredient and click submit, I am redirected to dish's show page where I see new ingredient" do
      visit dish_path(@dish_1)

      within("#main_info") do
        expect(page).to_not have_content("Butter")
      end

      within ("#ingredient_form") do
        select('Butter', from: 'dish_ingredient')
        click_button("Add an Ingredient")
        expect(current_path).to eq(dish_path(@dish_1))
      end

      within("#main_info") do
        expect(page).to have_content("Butter")
      end
    end
  end
end
