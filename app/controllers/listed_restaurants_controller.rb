class ListedRestaurantsController < ApplicationController
  before_action :set_listed_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /listed_restaurants
  # GET /listed_restaurants.json
  def index
    @listed_restaurants = ListedRestaurant.all
  end

  # GET /listed_restaurants/1
  # GET /listed_restaurants/1.json
  def show
  end

  # GET /listed_restaurants/new
  def new
    @listed_restaurant = ListedRestaurant.new
  end

  # GET /listed_restaurants/1/edit
  def edit
  end

  # POST /listed_restaurants
  # POST /listed_restaurants.json
  def create
    @listed_restaurant = ListedRestaurant.new(listed_restaurant_params)

    respond_to do |format|
      if @listed_restaurant.save
        format.html { redirect_to @listed_restaurant, notice: 'Listed restaurant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @listed_restaurant }
      else
        format.html { render action: 'new' }
        format.json { render json: @listed_restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listed_restaurants/1
  # PATCH/PUT /listed_restaurants/1.json
  def update
    respond_to do |format|
      if @listed_restaurant.update(listed_restaurant_params)
        format.html { redirect_to @listed_restaurant, notice: 'Listed restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @listed_restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listed_restaurants/1
  # DELETE /listed_restaurants/1.json
  def destroy
    @listed_restaurant.destroy
    respond_to do |format|
      format.html { redirect_to listed_restaurants_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listed_restaurant
      @listed_restaurant = ListedRestaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listed_restaurant_params
      params[:listed_restaurant]
    end
end
