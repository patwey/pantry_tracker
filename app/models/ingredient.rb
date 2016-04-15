class Ingredient < ActiveRecord::Base
  has_many :user_ingredients
  has_many :users, through: :user_ingredients

  validates :name, presence: true,
                   uniqueness: true,
                   format: { with: /\A[a-zA-z ]+\z/,
                             messsage: 'only allows letters in name' }
  validates :units, presence: true,
                    format: { with: /\A[a-zA-z ]+\z/,
                              messsage: 'only allows letters in units' }

  def name_with_units
    "#{name} (#{units})"
  end
end
