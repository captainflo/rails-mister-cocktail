class ReviewsController < ApplicationController
  before_action :find_cocktail, only: [ :new, :create ]

  def new
    @review = @cocktail.reviews.new
  end

  def create
    @review = @cocktail.reviews.build(review_params)
    if @review.save
    redirect_to cocktail_path(@cocktail)
    else
      @dose = Dose.new
      render '/cocktails/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
