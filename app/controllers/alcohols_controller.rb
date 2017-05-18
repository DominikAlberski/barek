class AlcoholsController < ApplicationController
  before_action :authenticate_user!, except: %I(index show)

  def index
    @alcohols = Alcohol.all
  end

  def show
    @alcohol = Alcohol.find(params[:id])
    @details = details(@alcohol.kind)
    @photo = @alcohol.photo.url(:medium)
    @coctails = Coctail.with_simple_alcohol_kind(@alcohol.kind)
  end

  def new
    @alcohol = current_user.alcohols.new
  end

  def create
    @alcohol = current_user.alcohols.new(alcohol_params)
    if @alcohol.save
      flash[:notice] = "Utworzono alcohol"
      redirection(@alcohol.kind, 'create')
    else
      flash[:error] = "Nie udało się zapisać"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  protected

  def redirection(kind, action = '')
    case action
    when 'create'
      case kind
      when 'vodka' then redirect_to new_vodka_path
      when 'whiskey' then redirect_to new_whiskey_path
      when 'wine' then redirect_to new_wine_path
      when 'liqueur' then redirect_to new_liqueur_path
      when 'other' then redirect_to new_other_path
      end
    when 'edit'
      case kind
      when 'vodka' then redirect_to edit_vodka_path
      when 'whiskey' then redirect_to edit_whiskey_path
      when 'wine' then redirect_to edit_wine_path
      when 'liqueur' then redirect_to edit_liqueur_path
      when 'other' then redirect_to edit_other_path
      end
    when ''
      case kind
      when 'vodka' then redirect_to vodka_path
      when 'whiskey' then redirect_to whiskey_path
      when 'wine' then redirect_to wine_path
      when 'liqueur' then redirect_to liqueur_path
      when 'other' then redirect_to other_path
      end
    end
  end

  def details(det)
    case det
    when 'vodka' then @alcohol.vodka
    when 'whiskey' then @alcohol.whiskey
    when 'wine' then @alcohol.wine
    when 'liqueur' then @alcohol.liqueur
    when 'other' then @alcohol.other
    else
      'No details availble'
    end
  end

  private

  def alcohol_params
    params.require(:alcohol).permit(:name, :brand, :kind, :country, :alk, :price, :photo)
  end
end
