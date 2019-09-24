class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
    @pagy, @movies = pagy(Movie.all)
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    if @movie.avg_rating && @movie.avg_rating.rating
      @avg_rating = @movie.avg_rating.rating
    else
      @avg_rating = "No rating"
    end
    if user_signed_in?
      @ratings = Rating.where(user_id: current_user.id)
    end
  end

  # GET /movies/new
  def new
    @movie = Movie.new
    @valid_categories = ValidCategory.all.map { |valid_category| valid_category.name }
  end

  # GET /movies/1/edit
  def edit
    @valid_categories = ValidCategory.all.map { |valid_category| valid_category.name }
  end

  # POST /movies
  # POST /movies.json
  def create
    categories = params["categories"]
    @movie = Movie.new(movie_params)
    ActiveRecord::Base.transaction do
      @movie.save!
      categories.each { |category|
        @category = Category.new({category: category, movie_id: @movie.id})
        @category.save!
      }
      redirect_to @movie
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    categories = params["categories"]
    ActiveRecord::Base.transaction do
      @movie.update!(movie_params)
      @movie.category.all.each do |old_cat|
        old_cat.destroy!
      end
      categories.each { |category|
        @category = Category.new({valid_category_id: ValidCategory.find_by_name(category).id, movie_id: @movie.id})
        @category.save!
      }
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def movie_params
    params.require(:movie).permit(:title, :category, :description)
  end
end
