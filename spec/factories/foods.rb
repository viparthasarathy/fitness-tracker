FactoryGirl.define do
  factory :food do
    calories 150
    protein 10
    carbs 5
    fats 3
    association :entry, :factory => :entry
    name "Pizza"
  end
end
