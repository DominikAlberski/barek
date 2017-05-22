class SimpleAlcoholsController < ApplicationController
  before_action :authenticate_user!, except: %I(index show)

  def new
    coctail = Coctail.find(params[:coctail_id])
    flash[:alert] = "You can't change other Users Coctails" and redirect_to coctail_path(coctail) and return unless authorize_access?(coctail)
    @coctail = current_user.coctails.find(params[:coctail_id])
    @simple_alcohol = @coctail.simple_alcohols.new
  end

  def create
    coctail = Coctail.find(params[:coctail_id])
    @simple_alcohol = SimpleAlcohol.new(simple_alcohol_params)
    if @simple_alcohol.save
      flash[:notice] = "Successfully added new alcohol"
      coctail.simple_alcohols << @simple_alcohol
      ingredient_id = coctail.ingredients.last
      redirect_to edit_ingredient_path(ingredient_id) # formularz ustawiający ilość danego składnika
    else
      flash[:alert] = "Somthing went wrong try again"
      render new
    end
  end

  def destroy
    simple_alcohol = SimpleAlcohol.find(params[:id])
    coctail = simple_alcohol.ingredients.first.coctail
    flash[:alert] = "You can't change other Users Coctails" and redirect_to coctail_path(coctail) and return unless authorize_access?(coctail)
    simple_alcohol.destroy
    flash[:notice] = "Successfully deleted ingredient"
    redirect_to coctail_path(coctail)
  end

  private

  def simple_alcohol_params
    params.require(:simple_alcohol).permit(:name, :kind)
  end
end
