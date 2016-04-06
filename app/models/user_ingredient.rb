class UserIngredient < ActiveRecord::Base
  belongs_to :user
  belongs_to :ingredient

  validates :amount, presence: true,
                     numericality: { only_integer: true,
                                     greater_than_or_equal_to: 0 }
end
