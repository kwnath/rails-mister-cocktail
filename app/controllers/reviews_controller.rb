class ReviewsController < ApplicationController
  before_action :set_review, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = @cocktail.reviews.new(review_params)
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :cocktail_id)
  end

  def set_review
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
