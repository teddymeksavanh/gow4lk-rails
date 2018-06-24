# spec/factories/types.rb
FactoryBot.define do
    factory :type do
        name { Faker::Lorem.word }
        description { Faker::Lorem.sentence }
        color { Faker::Color.hex_color }
        stroll_id nil
    end
  end