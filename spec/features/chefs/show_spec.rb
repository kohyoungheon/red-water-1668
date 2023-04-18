require 'rails_helper'

RSpec.describe 'Chef Show Page', type: :feature do
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
    @dish_ingredient_7 = DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_7.id)
  end

  describe "Chef's Show Page (User Story 3)" do
    it "displays a link to visit a chef's ingredients index page" do
      visit chef_path(@chef_1)
      expect(page).to have_link("View used ingredients")
    end
    it "clicking link redirects me to page where i can see all ingredients used by chef" do
      visit chef_path(@chef_1)
      expect(page).to have_link("View used ingredients")
      click_link "View used ingredients"
      expect(current_path).to eq(chef_ingredients_path(@chef_1))
      expect(page).to have_content("#{@chef_1.name}'s Ingredients")
      expect(page).to have_content("Beef Asparagus Rice Mushroom")

      visit chef_path(@chef_2)
      click_link "View used ingredients"
      expect(current_path).to eq(chef_ingredients_path(@chef_2))
      expect(page).to have_content("#{@chef_2.name}'s Ingredients")
      expect(page).to have_content("Lobster Tail Butter Lemon")
    end
  end
end
# As a visitor
# When I visit a chef's show page
# I see a link to view a list of all ingredients that this chef uses in their dishes.
# When I click on that link
# I'm taken to a chef's ingredients index page
# and I can see a unique list of names of all the ingredients that this chef uses.