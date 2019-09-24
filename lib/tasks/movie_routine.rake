namespace :movie_routine do
  desc "Calculate the avg movie rating."
  task calculate_avg_rating: :environment do
    Movie.all.each do |movie|
      avg_rating = movie.ratings.average(:rating)
      avg_rating_record = AvgRating.find_by_movie_id movie.id
      if avg_rating_record
        avg_rating_record.update({rating: avg_rating})
      else
        @new_record = AvgRating.new({rating: avg_rating, movie_id: movie.id})
        @new_record.save!
      end
    end
    log "Movie Ratings Updated"
  end

  def log(msg)
    puts msg
    Rails.logger.info msg
  end

end
