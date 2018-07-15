# spec/factories/strolls.rb
FactoryBot.define do
    factory :stroll do
        name { Faker::Lorem.word }
        description { Faker::Lorem.sentence }
        length { Faker::Number.number(2) }
        city { Faker::Address.city }
        country { Faker::Address.country }
        latitude { Faker::Address.latitude }
        longitude { Faker::Address.longitude }
        created_by { Faker::Number.number(10) }
    end
  end