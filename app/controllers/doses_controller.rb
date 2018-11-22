class DosesController < ApplicationController
 def new
    @cocktail = Cocktail.find(params[:id])
    @ingredient = Ingredient.find(params[:id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(doses_params)
    # Find le cocktail & ingredient
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    # @dose.save
    # redirect_to cocktail_path(@cocktail)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
