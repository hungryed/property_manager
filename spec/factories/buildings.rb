FactoryGirl.define do
  factory :building do
    sequence(:address) { |n| "The Mo#{n}n" }
    sequence(:city) { |n| "Ci#{n}y" }
    state 'Wisconsin'
    postal_code '54321'
    description 'Bears'
  end
end
