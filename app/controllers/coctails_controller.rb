class CoctailsController < ApplicationController
  before_action :authenticate_user!, except: %I(index show)

  def index
    @coctails = Coctail.all
  end

  def show
    @coctail = Coctail.find(params[:id])
  end

  def new
    @coctail = current_user.coctails.new
  end

  def create
    @coctail = current_user.coctails.new(coctail_params)
    if @coctail.save
      flash[:notice] = "Successfully created coctail"
      redirect_to coctails_path
    else
      flash[:error] = "Something went wrong try again"
      render new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    coctail = Coctail.find(params[:id])
    if current_user.id != coctail.user_id
      flash[:notice] = "You can't delete other users Coctails"
      redirect_to coctails_path
    else
      coctail.destroy
      flash[:notice] = "Successfully deleted Coctail"
      redirect_to coctails_path
    end
  end

  private

  def coctail_params
    params.require(:coctail).permit(:name, :description)
  end

end
