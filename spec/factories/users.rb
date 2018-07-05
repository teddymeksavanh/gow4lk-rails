# spec/factories/users.rb
FactoryBot.define do
    factory :user do
        name { Faker::Name.name }
        email { Faker::Internet.email }
        admin false
        password 'foobar'
    end
end