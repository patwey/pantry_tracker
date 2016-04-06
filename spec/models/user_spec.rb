require 'rails_helper'

RSpec.describe User, type: :model do
  def valid_user
    User.new(name: 'Archie',
             email: 'archie@example.com',
             password: 'password')
  end

  it 'is valid' do
    expect(valid_user).to be_valid
  end

  it 'is invalid without a name' do
    user = valid_user
    user.name = nil

    expect(user).not_to be_valid
  end

  it 'is invalid without an email' do
    user = valid_user
    user.email = nil

    expect(user).not_to be_valid
  end

  it 'is invalid without a unique email' do
    valid_user.save
    user = valid_user

    expect(user).not_to be_valid
  end

  it 'is invalid without a properly formatted email' do
    user = valid_user
    user.email = 'www.google.com'

    expect(user).not_to be_valid
  end

  it 'is invalid without a password' do
    user = valid_user
    user.password = nil

    expect(user).not_to be_valid
  end

  it 'has many user_ingredients' do
    expect(valid_user).to respond_to(:user_ingredients)
  end

  it 'has many ingredients' do
    expect(valid_user).to respond_to(:ingredients)
  end
end
