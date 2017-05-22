class OtherIngredientsController < ApplicationController
  before_action :authenticate_user!, except: %I(index show)

  def new
    coctail = Coctail.find(params[:coctail_id])
    flash[:alert] = "You can't change other Users Coctails" and redirect_to coctail_path(coctail) and return unless authorize_access?(coctail)
    @coctail = current_user.coctails.find(params[:coctail_id])
    @other_ingredient = @coctail.other_ingredients.new
  end

  def create
    coctail = Coctail.find(params[:coctail_id])
    @other_ingredient = OtherIngredient.new(other_ingredient_params)
    if @other_ingredient.save
      flash[:notice] = "Successfully added new ingredient"
      coctail.other_ingredients << @other_ingredient
      ingredient_id = coctail.ingredients.last
      redirect_to edit_ingredient_path(ingredient_id) # formularz ustawiający ilość danego składnika
    else
      flash[:alert] = "Something went wrong try again"
      render new
    end
  end

  def destroy
    other_ingredient = OtherIngredient.find(params[:id])
    coctail = other_ingredient.ingredients.first.coctail
    flash[:alert] = "You can't change other Users Coctails" and redirect_to coctail_path(coctail) and return unless authorize_access?(coctail)
    other_ingredient.destroy
    flash[:notice] = "Successfully deleted ingredient"
    redirect_to coctail_path(coctail)
  end

  private 

  def other_ingredient_params
    params.require(:other_ingredient).permit(:name)
  end
end
