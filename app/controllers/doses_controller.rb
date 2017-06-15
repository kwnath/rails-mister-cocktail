class DosesController < ApplicationController
  before_action :set_dose, only: [:edit, :update, :destroy]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.new(dose_params)

      if @dose.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
  end

  def edit
  end

  def update
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail_id)
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
