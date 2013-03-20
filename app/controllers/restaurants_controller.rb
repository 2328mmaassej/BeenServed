class RestaurantsController < ApplicationController

require 'open-uri'
require 'json'
  before_filter :authorize_user, except: [:index,:show]

  def authorize_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "Please login first."
    end
  end


  def index
    if params[:keyword].present?
      keyword = params[:keyword].downcase
      @restaurants = Restaurant.where("LOWER(name) LIKE ?", "%#{keyword}%").paginate(:page => params[:page], :per_page => 10)
    else
      @restaurants = Restaurant.order("name asc").paginate(:page => params[:page], :per_page => 10)
    end
    if @restaurants.empty?
      redirect_to new_restaurant_url, notice: "Restaurant not found. Please add a new restaurant."
    end

    @user = User.new

  end

  def show
    @restaurant = Restaurant.find(params[:id])

    @user = User.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @restaurant }
    end
  end

  # GET /restaurants/new
  # GET /restaurants/new.json
  def new
    @restaurant = Restaurant.new

    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restaurant }
    end
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])

    @user = User.new

  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(params[:restaurant])

    @user = User.new

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully created.' }
        format.json { render json: @restaurant, status: :created, location: @restaurant }
      else
        format.html { render action: "new" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /restaurants/1
  # PUT /restaurants/1.json
  def update
    @restaurant = Restaurant.find(params[:id])

    @user = User.new

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end
end
