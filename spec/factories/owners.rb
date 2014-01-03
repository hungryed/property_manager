FactoryGirl.define do
  factory :owner do
    sequence(:first_name) { |n| "J#{n}e" }
    sequence(:last_name) { |n| "Sm#{n}th" }
    email 'user@aol.com'
  end
end
