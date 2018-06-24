# spec/factories/paths.rb
FactoryBot.define do
    factory :path do
        name { Faker::Lorem.word }
        description { Faker::Lorem.sentence }
        latitude { Faker::Address.latitude }
        longitude { Faker::Address.longitude }
        stroll_id nil
    end
  end