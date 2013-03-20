class DishesController < ApplicationController
  # GET /dishes
  # GET /dishes.json
  before_filter :authorize_user, except: [:index,:show]

  def authorize_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "Please login first."
    end
  end

  def index
    if params[:keyword].present?
      keyword = params[:keyword].downcase
      @dishes = Dish.where("LOWER(category) LIKE ?", "%#{keyword}%").paginate(:page => params[:page], :per_page => 10)
    else
      @dishes = Dish.paginate(:page => params[:page], :per_page => 10)
    end

    if session[:user_id].presence == nil
      @user = User.new
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dishes }
    end
  end

  # GET /dishes/1
  # GET /dishes/1.json
  def show
    @dish = Dish.find(params[:id])

    if session[:user_id].presence == nil
      @user = User.new
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dish }
    end
  end

  # GET /dishes/new
  # GET /dishes/new.json
  def new
    @dish = Dish.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dish }
    end
  end

  # GET /dishes/1/edit
  def edit
    @dish = Dish.find(params[:id])
  end

  # POST /dishes
  # POST /dishes.json
  def create
    @dish = Dish.new(params[:dish])

    respond_to do |format|
      if @dish.save
        format.html { redirect_to dishes_url, notice: 'Dish was successfully created.' }
        format.json { render json: @dish, status: :created, location: @dish }
      else
        format.html { render action: "new" }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dishes/1
  # PUT /dishes/1.json
  def update
    @dish = Dish.find(params[:id])

    respond_to do |format|
      if @dish.update_attributes(params[:dish])
        format.html { redirect_to @dish, notice: 'Dish was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish = Dish.find(params[:id])
    @dish.destroy

    respond_to do |format|
      format.html { redirect_to dishes_url }
      format.json { head :no_content }
    end
  end
end
