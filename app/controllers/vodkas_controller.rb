class VodkasController < ApplicationController
  def new
    @vodka = Vodka.new
  end

  def edit
  end

  def update
  end

  def create
    @vodka = Alcohol.last.build_vodka(vodka_params)
    if @vodka.save!
      flash[:notice] = "Utworzono alcohol"
      redirect_to alcohols_path
    else
      flash[:error] = "Nie udało się zapisać"
      render :new
    end

  end

  private

  def vodka_params
    params.require(:vodka).permit(:kind)
  end
end
