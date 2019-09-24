class ValidCategoriesController < ApplicationController
  before_action :check_admin
  before_action :set_valid_category, only: [:show, :edit, :update, :destroy]

  # GET /valid_categories
  # GET /valid_categories.json
  def index
    @valid_categories = ValidCategory.all
  end

  # GET /valid_categories/1
  # GET /valid_categories/1.json
  def show
  end

  # GET /valid_categories/new
  def new
    @valid_category = ValidCategory.new
  end

  # GET /valid_categories/1/edit
  def edit
  end

  # POST /valid_categories
  # POST /valid_categories.json
  def create
    @valid_category = ValidCategory.new(valid_category_params)

    respond_to do |format|
      if @valid_category.save
        format.html { redirect_to @valid_category, notice: 'Valid category was successfully created.' }
        format.json { render :show, status: :created, location: @valid_category }
      else
        format.html { render :new }
        format.json { render json: @valid_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valid_categories/1
  # PATCH/PUT /valid_categories/1.json
  def update
    respond_to do |format|
      if @valid_category.update(valid_category_params)
        format.html { redirect_to @valid_category, notice: 'Valid category was successfully updated.' }
        format.json { render :show, status: :ok, location: @valid_category }
      else
        format.html { render :edit }
        format.json { render json: @valid_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valid_categories/1
  # DELETE /valid_categories/1.json
  def destroy
    @valid_category.destroy
    respond_to do |format|
      format.html { redirect_to valid_categories_url, notice: 'Valid category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_valid_category
    @valid_category = ValidCategory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def valid_category_params
    params.require(:valid_category).permit(:name)
  end

  def check_admin
    unless user_signed_in?
      raise ActionController::RoutingError.new('Not Found')
    end
    unless current_user.admin
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
