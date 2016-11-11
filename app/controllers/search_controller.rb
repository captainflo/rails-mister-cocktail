class SearchController < ApplicationController

  def index
    @cocktails = Cocktail.where('name LIKE ?', "%#{params[:query]}%")
    render 'cocktails/index'
  end
end
