FactoryGirl.define do
  factory :food do
    calories 1
    protein 1
    carbs 1
    fats 1
    association :entry, :factory => :entry
  end
end
