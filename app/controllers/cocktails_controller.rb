class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @cock3 = Cocktail.first(3)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def params_cocktail
    params.require(:cocktail).permit(:name, :image_url)
  end
end
