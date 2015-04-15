class ReviewsController < ApplicationController
  before_action :find_restaurant, only: :create

  def create
    @review = @restaurant.reviews.new(strong_params)
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      flash[:alert] = "Unable to add your review"
      render 'restaurants/show'
    end
  end

  private

  def strong_params
    params.require(:review).permit(:content, :rating)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
