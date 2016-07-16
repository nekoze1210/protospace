FactoryGirl.define do

  factory :prototype do
    title               { Faker::Commerce.product_name }
    catch_copy          { Faker::Company.catch_phrase }
    concept             { Faker::Lorem.sentence }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

end
