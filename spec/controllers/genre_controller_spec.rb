require 'rails_helper'

RSpec.describe GenreController, type: :controller do
  before do
    @horror = ValidCategory.create name: "Horror"
    @movie = Movie.create title: "Test movie", description: "No description."
    Category.create movie_id: @movie.id, valid_category_id: @horror.id
  end

  describe "GET show" do
    it "show movies" do
      get :show, params: {id: "Horror"}
      expect(assigns(:movies).ids).to include(@movie.id)
    end
  end

end
