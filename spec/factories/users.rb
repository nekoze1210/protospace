FactoryGirl.define do
  factory :user do
    nickname               { Faker::Name.name }
    email                  { Faker::Internet.email }
    profile                { Faker::Lorem.sentence }
    member                 { Faker::Company.name  }
    work                   { Faker::App.name }
    password               '12345678'
    password_confirmation  '12345678'
  end
end
