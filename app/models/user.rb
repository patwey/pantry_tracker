class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A[\w]+@[\w]+.[\w]+\z/,
                              message: 'improper email format (e.g. johndoe@example.com)' }
end
