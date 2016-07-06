FactoryGirl.define do
  factory :user do
    password = Faker::Internet.password(8)
    nickname               { Faker::Name.name }
    email                  { Faker::Internet.email }
    profile                { Faker::Lorem.sentence }
    member                 { Faker::Company.name  }
    work                   { Faker::App.name }
    password               password
    password_confirmation  password
  end
end
