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
Type.create(color: Faker::Color.hex_color, description: '', name: 'Pélerinage')
Type.create(color: Faker::Color.hex_color, description: '', name: 'Hors-sentier')

User.create(name: 'Denver', email: 'denver@gmail.com', password: 'denver', admin: true);
User.create(name: 'Denver friend', email: 'denverfriend@gmail.com', password: 'denver');

3.times do
  user = User.create(
    name: Faker::OnePiece.character,
    email: Faker::Internet.free_email,
    password: Faker::Internet.password
  )

  # Strolls
  count = 0
  iteration = rand(1..3)
  while count < iteration
    stroll = user.strolls.create(
      name: Faker::OnePiece.location,
      description: Faker::Lorem.sentence(6, true),
      longitude: Faker::Address.longitude,
      latitude: Faker::Address.latitude,
      length: Faker::Number.decimal(2, 2),
      city: Faker::Address.full_address,
      country: Faker::Address.full_address,
      created_by: user.id
    )

    # Paths
    countPaths = 0
    iterationPaths = rand(2..4)
    while countPaths < iterationPaths
        path = Path.create(
            name: Faker::Company.name,
            description: Faker::Lorem.sentence,
            longitude: Faker::Address.longitude,
            latitude: Faker::Address.latitude,
            stroll_id: stroll.id
        )
        countPaths+=1
    end

    # Comments
    countComments = 0
    iterationComments = rand(1..7)
    while countComments < iterationComments
        comment = Comment.create(
            description: Faker::Lorem.sentence,
            stroll_id: stroll.id,
            created_by: User.find(User.pluck(:id).sample).id
        )
        countComments+=1
    end

    # Types
    countTypes = 0
    iterationTypes = rand(1..3)
    while countTypes < iterationTypes
        type = Strolltype.create(
            type_id: Type.find(Type.pluck(:id).sample).id,
            stroll_id: stroll.id
        )
        countTypes+=1
    end

    # Notes
    countNotes = 0
    iterationNotes = rand(1..7)
    while countNotes < iterationNotes
        note = Note.create(
            description: true,
            stroll_id: stroll.id,
            created_by: User.find(User.pluck(:id).sample).id
        )
        countNotes+=1
    end
    count+=1
  end
end
