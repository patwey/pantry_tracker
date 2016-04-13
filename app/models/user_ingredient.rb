class UserIngredient < ActiveRecord::Base
  belongs_to :user
  belongs_to :ingredient

  validates :amount, presence: true,
                     numericality: { only_integer: true,
                                     greater_than_or_equal_to: 0 }

  def self.for_user_with_id(id)
    where(user_id: id).includes(:ingredient)
  end

  def name
    ingredient.name
  end

  def units
    ingredient.units
  end
end
