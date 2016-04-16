class UserIngredientsController < ApplicationController
  def index
    @user_ingredients = UserIngredient.for_user_with_id(current_user.id)
  end

  def new
    @ingredients = Ingredient.where.not(id: current_user.ingredients.pluck(:id))
    @user_ingredient = UserIngredient.new
  end

  def create
    user_ingredient = current_user.user_ingredients.new(user_ingredient_params)

    if user_ingredient.save
      flash[:success] = 'Ingredient added to pantry'
      redirect_to pantry_path
    else
      flash[:error] = 'Unable to add ingredient to pantry'
      redirect_to new_user_ingredient_path
    end
  end

  private

  def user_ingredient_params
    params.require(:user_ingredient).permit(:ingredient_id, :amount, :user_id)
  end
end
