# spec/factories/strolls.rb
FactoryBot.define do
    factory :stroll do
        name { Faker::Lorem.word }
        description { Faker::Lorem.sentence }
        created_date { Faker::Date.backward(17) }
        length { Faker::Number.number(2) }
        city { Faker::Address.city }
        country { Faker::Address.country }
        latitude { Faker::Address.latitude }
        longitude { Faker::Address.longitude }
    end
  end