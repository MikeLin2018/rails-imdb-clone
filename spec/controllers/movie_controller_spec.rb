require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  before do
    @title = "Test movie"
    @description = "No description."
    @horror = ValidCategory.create name: "Horror"
    @horror = ValidCategory.create name: "Romance"
    @movie = Movie.create title: @title, description: @description
    Category.create movie_id: @movie.id, valid_category_id: @horror.id
  end

  describe "GET show" do
    it "show movies" do
      get :show, params: {id: @movie.id}
      expect(assigns(:movie).id).to eq(@movie.id)
      expect(assigns(:movie).title).to eq(@title)
      expect(assigns(:movie).description).to eq(@description)
    end
  end

  describe "POST new" do
    it "raise error when not admin" do
      expect { post :create, params: {category: ["Horror"],
                                      title: "New Movie",
                                      description: "New Description"} }
          .to raise_error(ActionController::RoutingError)
    end
  end

  describe "POST new" do
    login_admin
    it "create movie when admin" do
      post :create, params: {movie: {title: "New Movie",
                                     description: "New Description"},
                             categories: ["Horror"]}
      expect(Movie.all.map { |movie| movie.title }).to include("New Movie")
      expect(Movie.all.map { |movie| movie.description }).to include("New Description")
    end
  end

  describe "POST edit" do
    it "raise error when not admin" do
      expect { put :update, params: {movie: {title: "Edit Movie",
                                             description: "Edit Description"},
                                     categories: ["Romance"],
                                     id: @movie.id} }
          .to raise_error(ActionController::RoutingError)
    end
  end

  describe "POST edit" do
    login_admin
    it "edit movie when admin" do
      put :update, params: {movie: {title: "Edit Movie",
                                    description: "Edit Description"},
                            categories: ["Romance"],
                            id: @movie.id}
      expect(Movie.all.map { |movie| movie.title }).to include("Edit Movie")
      expect(Movie.all.map { |movie| movie.description }).to include("Edit Description")
      expect(Movie.all.map { |movie| movie.title }).not_to include(@title)
      expect(Movie.all.map { |movie| movie.description }).not_to include(@description)
    end
  end

  describe "GET index" do
    it "raise error when not admin" do
      expect { get :index }.to raise_error(ActionController::RoutingError)
    end
  end

  describe "GET index" do
    login_admin
    it "raise error when not admin" do
      expect { get :index }.not_to raise_error(ActionController::RoutingError)
    end
  end

end
