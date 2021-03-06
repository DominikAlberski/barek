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
    @coctail = Coctail.find(params[:id])
  end

  def update
    @coctail = Coctail.find(params[:id])
    if @coctail.update(coctail_params)
      flash[:notice] = 'Coctail was updated'
      redirect_to coctail_path(@coctail)
    else
      flash[:error] = "Something went wrong, try again"
      render :edit
    end
  end

  def destroy
    coctail = Coctail.find(params[:id])
    flash[:alert] = "You can't change other Users Coctails" and redirect_to coctail_path(coctail) and return unless authorize_access?(coctail)
    coctail.destroy
    flash[:notice] = "Successfully deleted Coctail"
    redirect_to coctails_path
  end

  private

  def coctail_params
    params.require(:coctail).permit(:name, :description, :image)
  end

end
