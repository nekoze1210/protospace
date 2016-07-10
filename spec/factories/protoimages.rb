include ActionDispatch::TestProcess
FactoryGirl.define do

  factory :protoimage do
    prototype
    thumbnail { fixture_file_upload("spec/fixtures/img/sample.png", 'image/png') }

    trait :main do
      role :main
    end

    trait :sub do
      role :sub
    end
  end

end
