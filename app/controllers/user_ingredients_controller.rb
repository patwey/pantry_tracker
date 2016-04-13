class UserIngredientsController < ApplicationController
  def index
    @user_ingredients = UserIngredient.for_user_with_id(current_user.id)
  end
end
