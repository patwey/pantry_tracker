class Ingredient < ActiveRecord::Base
  validates :name, presence: true,
                   uniqueness: true,
                   format: { with: /\A[a-zA-z ]+\z/,
                             messsage: 'only allows letters in name' }
  validates :units, presence: true,
                    format: { with: /\A[a-zA-z ]+\z/,
                              messsage: 'only allows letters in units' }
end
