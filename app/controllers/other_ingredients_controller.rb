class OtherIngredientsController < ApplicationController
  before_action :authenticate_user!, except: %I(index show)

  def index
  end

  def show
  end

  def new
    @coctail = current_user.coctails.find(params[:coctail_id])
    @other_ingredient = @coctail.other_ingredients.new
  end

  def create
    coctail = Coctail.find(params[:coctail_id])
    @other_ingredient = OtherIngredient.new(other_ingredient_params)
    if @other_ingredient.save
      flash[:notice] = "Successfully added new ingredient"
      coctail.other_ingredients << @other_ingredient
      redirect_to coctail_path(params[:coctail_id])
    else
      flash[:error] = "Somthing went wrong try again"
      render new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def other_ingredient_params
    params.require(:other_ingredient).permit(:name)
  end
end
