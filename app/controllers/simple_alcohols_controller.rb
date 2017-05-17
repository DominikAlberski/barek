class SimpleAlcoholsController < ApplicationController
  before_action :authenticate_user!, except: %I(index show)

  def index
  end

  def show
  end

  def new
    @coctail = current_user.coctails.find(params[:coctail_id])
    @simple_alcohol = @coctail.simple_alcohols.new
  end

  def create
    coctail = Coctail.find(params[:coctail_id])
    @simple_alcohol = SimpleAlcohol.new(simple_alcohol_params)
    if @simple_alcohol.save
      flash[:notice] = "Successfully added new alcohol"
      coctail.simple_alcohols << @simple_alcohol
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

  def simple_alcohol_params
    params.require(:simple_alcohol).permit(:name, :kind)
  end
end