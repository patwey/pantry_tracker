class CreateUserIngredients < ActiveRecord::Migration
  def change
    create_table :user_ingredients do |t|
      t.references :user, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end
