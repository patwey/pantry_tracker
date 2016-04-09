class Seed
  def self.start
    create_users
    create_ingredients
    create_user_ingredients
  end

  def self.create_users
    20.times do
      User.create!(name: Faker::Name.name,
                   email: Faker::Internet.email,
                   password: 'password')
    end
  end

  def self.create_ingredients
    fruits = ['Red Apples', 'Blood Oranges', 'Cherries', 'Cranberries', 'Red Grapes', 'Red Grapefruit', 'Pears', 'Pomegranates', 'Raspberries', 'Strawberries', 'Watermelon',	'Beets', 'Red Peppers', 'Radishes', 'Radicchio', 'Red Onions', 'Red Potatoes', 'Rhubarb', 'Tomatoes']
    units = %w(ounces grams)
    fruits.each do |fruit|
      Ingredient.create(name: fruit,
                        units: units.sample)
    end
  end

  def self.create_user_ingredients
    u_ids = User.pluck(:id)
    i_ids = Ingredient.pluck(:id)
    50.times do
      UserIngredient.create!(user_id:       u_ids.sample,
                             ingredient_id: i_ids.sample,
                             amount:        Random.rand(10))
    end
  end
end

Seed.start
