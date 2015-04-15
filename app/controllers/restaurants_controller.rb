class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(strong_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      flash[:alert] = "Unable to add your restaurant"
      render :new
    end
  end

  def show
    @review = Review.new
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def strong_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
