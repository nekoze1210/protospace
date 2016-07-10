FactoryGirl.define do

  factory :comment do
    user
    prototype
    text                {Faker::Lorem.sentence}
  end

end
