FactoryGirl.define do

  factory :prototype do
    title               { Faker::Commerce.product_name }
    catch_copy          { Faker::Company.catch_phrase }
    concept             { Faker::Lorem.sentence }
  end

end
