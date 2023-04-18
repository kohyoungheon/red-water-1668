require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  before(:each) do
    @chef_1 = Chef.create!(name: "Gordon Ramsay")

    @dish_1 = @chef_1.dishes.create!(name: "Steak", description: "A delicious steak")
    @dish_2 = @chef_1.dishes.create!(name: "Rissoto", description: "A delicious rissoto")

    @ingredient_1 = Ingredient.create!(name: "Beef", calories: 100)
    @ingredient_2 = Ingredient.create!(name: "Asparagus", calories: 20)
    @ingredient_3 = Ingredient.create!(name: "Rice", calories: 70)
    @ingredient_4 = Ingredient.create!(name: "Mushroom", calories: 50)

    @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
    @dish_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
    @dish_ingredient_3 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_3.id)
    @dish_ingredient_4 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_4.id)
  end
  describe "relationships" do
    it {should have_many :dish_ingredients}
    it {should have_many(:dishes).through(:dish_ingredients)}
  end

  describe "class methods" do
    describe "::all_possible_ingredients" do
      it "return all ingredient NOT associated with dish" do
        expect(Ingredient.all_possible_ingredients(@dish_1)).to eq([@ingredient_3, @ingredient_4])
        expect(Ingredient.all_possible_ingredients(@dish_2)).to eq([@ingredient_1, @ingredient_2])
      end
    end
  end
end