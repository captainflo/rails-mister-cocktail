class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :new, :create ]

    def new
      @dose = Dose.new
    end

    def create
      @dose = @cocktail.doses.new(dose_params)
      @dose.ingredient = Ingredient.find(params[:dose][:ingredient]) unless params[:dose][:ingredient].empty?
      if @dose.save
      redirect_to cocktail_path(@cocktail)
      else
        render '/cocktails/show'
      end
    end

    private

    def dose_params
      params.require(:dose).permit(:description)
    end
    def find_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end
  end
