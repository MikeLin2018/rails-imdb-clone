class StaticPagesController < ApplicationController
  def home
    @pagy, @movies = pagy(Movie.all)
    if user_signed_in?
      @ratings = Rating.where(user_id: current_user.id)
    end
    @valid_categories = ValidCategory.all
  end
end
