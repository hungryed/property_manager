FactoryGirl.define do
  factory :owner do
    sequence(:first_name) { |n| "J#{n}e" }
    sequence(:last_name) { |n| "Sm#{n}th" }
    sequence(:display_string) { |n| "J#{n}e Sm#{n}th" }
    email 'user@aol.com'
  end
end
