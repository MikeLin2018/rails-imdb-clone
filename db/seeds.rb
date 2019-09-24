# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Initialize valid categories
valid_categories = [:Comedy, :Horror, :Romance, :Action, :Thriller, :Drama, :Crime, :Animation, :Adventure]
valid_categories.each do |valid_cateogry|
  ValidCategory.create({category: valid_cateogry})
end

# Initialize seed movies
seed_movies = []
200.times do |index|
  seed_movies << {title: 'Movie ' + index.to_s,
                  description: "Autem amet odio illo qui sed cumque. Officia enim totam numquam nihil optio voluptatum. Veniam culpa nemo ullam blanditiis ut ea.",
                  categories: valid_categories.sample(rand(9))}
end

seed_movies.each do |movie|
  new_movie = Movie.create({title: movie[:title], description: movie[:description]})
  movie[:categories].each do |category|
    Category.create({movie_id: new_movie.id, valid_category_id: ValidCategory.find_by_name(category).id})
  end
end

user = User.new(
    :email => "admin@test.com",
    :password => "password",
    :password_confirmation => "password",
    :admin => true
)
user.save!