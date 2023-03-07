class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    restaurant.save
    # DOESN'T HAVE A VIEW
    redirect_to restaurant_path(restaurant) # "/restaurants/#{restaurant.id}"
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    # DOESN'T HAVE A VIEW
    redirect_to restaurants_path
  end

  def destroy
    # find the right restaurant
    # call the destroy method on it to remove from the DB
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # {"authenticity_token"=>"[FILTERED]", "restaurant"=>{"name"=>"Burger Palce", "address"=>"London", "rating"=>"5"}, "commit"=>"Create Restaurant"}
  # "restaurant"=>{"name"=>"Burger Palce", "address"=>"London", "rating"=>"5"}
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
