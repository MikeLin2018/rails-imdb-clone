require 'rails_helper'

RSpec.describe RatingController, type: :controller do
  before do
    @horror = ValidCategory.create name: "Horror"
    @movie = Movie.create title: "Test movie", description: "No description."
    Category.create movie_id: @movie.id, valid_category_id: @horror.id
  end

  describe "Create rating" do
    login_user
    it "create new rating" do
      post :create, params: {movie_id: @movie.id,
                             rating: 8}
      expect(Rating.count).to eq(1)
      expect(Rating.all.map { |r| r.movie_id }).to eq([@movie.id])
      expect(Rating.all.map { |r| r.rating }).to eq([9])
    end
  end
end
