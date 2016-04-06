require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  def valid_ingredient
    Ingredient.new(name: 'Red Pepper',
                   units: 'Peppers')
  end

  it 'is valid' do
    expect(valid_ingredient).to be_valid
  end

  it 'is invalid without a name' do
    ingredient = valid_ingredient
    ingredient.name = nil

    expect(ingredient).not_to be_valid
  end

  it 'is invalid without a unique name' do
    valid_ingredient.save
    ingredient = valid_ingredient

    expect(ingredient).not_to be_valid
  end

  it 'is invalid without a name consisting only of letters' do
    ingredient = valid_ingredient
    ingredient.name = '1Potato'

    expect(ingredient).not_to be_valid
  end

  it 'is invalid without units' do
    ingredient = valid_ingredient
    ingredient.units = nil

    expect(ingredient).not_to be_valid
  end

  it 'is invalid without units consisting only of letters' do
    ingredient = valid_ingredient
    ingredient.units = '2 ounces'

    expect(ingredient).not_to be_valid
  end
end
