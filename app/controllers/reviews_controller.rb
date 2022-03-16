class ReviewsController < ApplicationController
  
  before_filter :authorize

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to '/', :notice => "Thank you for your review."
    else
      redirect_to :back
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    review = @product.reviews.find(params[:id])
    if review.destroy
      redirect_to :back
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :product_id,
      :description,
      :rating
    )
  end

end
