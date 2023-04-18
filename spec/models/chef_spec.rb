require 'rails_helper'

RSpec.describe Chef, type: :model do
  before(:each) do
    @chef_1 = Chef.create!(name: "Gordon Ramsay")

    @dish_1 = @chef_1.dishes.create!(name: "Steak", description: "A delicious steak")
    @dish_2 = @chef_1.dishes.create!(name: "Rissoto", description: "A delicious rissoto")

    @ingredient_1 = Ingredient.create!(name: "Beef", calories: 100)
    @ingredient_2 = Ingredient.create!(name: "Asparagus", calories: 20)
    @ingredient_3 = Ingredient.create!(name: "Rice", calories: 60)
    @ingredient_4 = Ingredient.create!(name: "Mushroom", calories: 40)


    @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
    @dish_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
    @dish_ingredient_3 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_3.id)
    @dish_ingredient_4 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_4.id)
    @dish_ingredient_4 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_1.id)#duplicate
  end
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    describe "#unique_ingredients" do
      it "return unique ingredients used by chef"do
        expect(@chef_1.unique_ingredients.pluck(:name)).to eq(["Asparagus", "Beef", "Mushroom", "Rice"])
      end
    end
  end
end