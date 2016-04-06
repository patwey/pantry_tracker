require 'rails_helper'

RSpec.describe UserIngredient, type: :model do
  before(:all) do
    @user = User.create(name: 'John',
                        email: 'johndoe@example.com',
                        password: 'password')
    @ingredient = Ingredient.create(name: 'Apple',
                                    units: 'Apples')
  end

  def valid_user_ingredient
    UserIngredient.new(user_id: @user.id,
                       ingredient_id: @ingredient.id,
                       amount: 2)
  end

  it 'is valid' do
    expect(valid_user_ingredient).to be_valid
  end

  it 'is invalid without an amount' do
    user_ingredient = valid_user_ingredient
    user_ingredient.amount = nil

    expect(user_ingredient).not_to be_valid
  end

  it 'is invalid without an amount at or above zero' do
    user_ingredient = valid_user_ingredient
    user_ingredient.amount = -1

    expect(user_ingredient).not_to be_valid
  end

  it 'is invalid without an integer amount' do
    user_ingredient = valid_user_ingredient
    user_ingredient.amount = 0.2

    expect(user_ingredient).not_to be_valid
  end

  it 'has a user' do
    expect(valid_user_ingredient).to respond_to(:user)
  end

  it 'has an ingredient' do
    expect(valid_user_ingredient).to respond_to(:ingredient)
  end
end
