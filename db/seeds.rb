# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Language
Type.create(color: Faker::Color.hex_color, description: '', name: 'Sport')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Tourisme')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Randonnée')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Aventure')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Urbex')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Religion')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Islam')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Boudhisme')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Chrétien')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Boutique')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Vélo')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Roller')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Skate')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Nature')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Parc')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Montagne')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Plage')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Ville')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Campagne')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Hors-sentier')

# Fake seeds

# google_ids = []
# 50.times do
#   google_ids.push(Faker::Code.ean)
# end

# 30.times do
#   user = User.create(
#     name: Faker::StarWars.character,
#     email: Faker::Internet.free_email,
#     password: Faker::Internet.password,
#     city: 'Paris',
#     country: 'France',
#     principal_language_id: 1,
#     avatar_id: rand(1..10),
#     firebase_id: Faker::Code.ean
#   )

#   user.languages.push(Language.find(2))

#   count = 0
#   iteration = rand(1..15)
#   while count < iteration
#     user.places.create(
#       name: Faker::Company.name,
#       img_url: Faker::LoremPixel.image,
#       address: Faker::Address.full_address,
#       longitude: Faker::Address.longitude,
#       latitude: Faker::Address.latitude,
#       google_id: google_ids.sample
#     )

#     user.comments.create(
#       content: Faker::Lorem.sentence,
#       rating: rand(1..5),
#       google_id: google_ids.sample
#     )
#     count+=1
#   end

#   count = 0
#   iteration = rand(1..5)
#   while count < iteration
#     current_google_id = google_ids.sample
#     reported_user =  User.includes(:comments).where("comments.google_id" => current_google_id).sample
#     if reported_user
#       user.reports.create(
#         google_id: current_google_id,
#         reported_user_id: reported_user.id
#       )
#       count+=1
#     end
#   end

# end
