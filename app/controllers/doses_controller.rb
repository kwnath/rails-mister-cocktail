class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Cocktail.find(params[:ingredient_id])
    @dose = Dose.new
  end

  def create
    @ingredient = Ingredient.find(params[:ingredient_id])
    @dose = @ingredient.doses.new(dose_params)
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
