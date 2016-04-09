class User < ActiveRecord::Base
  has_secure_password
  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A[\w._]+@[\w]+.[\w]+\z/,
                              message: 'improper email format (e.g. johndoe@example.com)' }
end
