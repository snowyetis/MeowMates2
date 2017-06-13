# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# animal.create
# animal.animalName = "Kitty Purriington"
# animal.gender = "female"
# animal.shots = "T"
# animal.fixed = "T"
# animal.content = "This is content"
# animal.user_id = 1
# animal.remote_animal_intro_avatar.url =
# User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')