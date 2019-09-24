class GenreController < ApplicationController
  def index
    @valid_categories = ValidCategory.all
  end

  def show
    @genre = params[:id]
    @pagy, @movies = pagy(Movie.includes(:category).where(categories: {valid_category_id: ValidCategory.find_by_name(@genre).id}))
    if user_signed_in?
      @ratings = Rating.where(user_id: current_user.id)
    end
  end


end
