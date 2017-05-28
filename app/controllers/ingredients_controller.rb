class IngredientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ingredient, only: %I(edit update)

  def edit
    coctail = @ingredient.coctail
    flash[:alert] = "You can't change other Users Coctails" and redirect_to coctail_path(coctail) and return unless authorize_access?(coctail)
  end

  def update
    if @ingredient.update(ingredient_params)
      flash[:notice] = 'Quantity have change!'
      redirect_to coctail_path(@ingredient.coctail)
    else
      flash[:alert] = 'Something went wrong try again'
      render :edit
    end
  end

  protected

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:quantity)
  end
end
