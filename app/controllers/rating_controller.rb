class RatingController < ApplicationController
  before_action :check_user, except: [:show]

  def create
    if Rating.exists?(user_id: current_user.id, movie_id: params[:movie_id].to_i)
      update
    else
      @rating = Rating.new({user_id: current_user.id,
                            movie_id: params[:movie_id].to_i,
                            rating: params[:rating].to_i})

      @rating.save
    end
  end

  def update
    @rating = Rating.find_by user_id: current_user.id, movie_id: params[:movie_id].to_i
    @rating.update(rating: params[:rating].to_i)
  end

  def check_user
    unless user_signed_in?
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
