class CoctailsController < ApplicationController
  before_action :authenticate_user!, except: %I(index show)
  before_action :set_coctail, only: %I(show destroy edit update)

  def index
    @coctails = Coctail.all
  end

  def show; end

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
    flash[:alert] = "You can't change other Users Coctails" and render :show and return unless authorize_access?(@coctail)
  end

  def update
    if @coctail.update(coctail_params)
      flash[:notice] = "Successfully edited Coctail"
      redirect_to coctail_path(@coctail)
    else
      flash[:alert] = "Something went wrong try again"
      render :edit
    end
  end

  def destroy
    flash[:alert] = "You can't change other Users Coctails" and redirect_to coctail_path(@coctail) and return unless authorize_access?(@coctail)
    @coctail.destroy
    flash[:notice] = "Successfully deleted Coctail"
    redirect_to coctails_path
  end

  protected

  def set_coctail
    @coctail = Coctail.find(params[:id])
  end

  private

  def coctail_params
    params.require(:coctail).permit(:name, :description, :image)
  end

end
