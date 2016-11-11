class DosesController < ApplicationController
before_action :set_dose, only: [:edit, :update, :destroy]
before_action :set_cocktail, only: [:create, :edit, :update, :destroy]

 def create
   @dose = @cocktail.doses.new(dose_params)
   if @dose.save
     redirect_to @cocktail
   else
     @review = Review.new
     render 'cocktails/show'
   end
 end

 def edit
 end

 def update
   if @dose.update(dose_params)
     redirect_to @cocktail
   else
     render :edit
   end
 end

 def destroy
   @dose.destroy
   redirect_to @cocktail
 end

 private

 def set_dose
   @dose = Dose.find(params[:id])
 end

 def set_cocktail
   @cocktail = Cocktail.find(params[:cocktail_id])
 end

 def dose_params
   params.require(:dose).permit(:ingredient_id, :description)
 end
end
