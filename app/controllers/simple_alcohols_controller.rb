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
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
