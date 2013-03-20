class MealsController < ApplicationController
  # GET /meals
  # GET /meals.json
  before_filter :authorize_user, except: [:index, :show]

  def authorize_user
    if session[:user_id].blank?
      redirect_to login_url, notice: "Please login first."
    end
  end

  def index
    if params[:keyword].present?
      keyword = params[:keyword].downcase
     @dishes = Dish.where("LOWER(category) LIKE ?", "%#{keyword}%").paginate(:page => params[:page], :per_page => 10)
     if @dishes.empty?
      redirect_to meals_url, notice: "No reviews match your search"
      return
      else
      @meals = []
      @dishes.each do |dish|
        dish.meals.order('rating desc').each do |meal|
          @meals << meal
        end
      end
    end
    else
     @meals = Meal.order('created_at desc')
     @meal = Meal.new(user_id: session[:user_id])
   end

   if session[:user_id].presence == nil
    @user = User.new
   end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meals }
      format.js
    end
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
    @meal = Meal.find(params[:id])
    if session[:user_id].presence == nil
     @user = User.new
   end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meal }
    end
  end

  # GET /meals/new
  # GET /meals/new.json
  def new
    @meal = Meal.new(user_id: session[:user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meal }
    end
  end

  # GET /meals/1/edit
  def edit
    @meal = Meal.find(params[:id])
  end

  # POST /meals
  # POST /meals.json
  def create
    @meal = Meal.new(params[:meal])

    respond_to do |format|
      if @meal.save
        format.html { redirect_to user_url(current_user.id)}
        format.json { render json: @meal, status: :created, location: @meal }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meals/1
  # PUT /meals/1.json
  def update
    @meal = Meal.find(params[:id])

    respond_to do |format|
      if @meal.update_attributes(params[:meal])
        format.html { redirect_to user_url(current_user.id), notice: 'Meal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy

    respond_to do |format|
      format.html { redirect_to user_url(current_user.id) }
      format.json { head :no_content }
      format.js
    end
  end
end
