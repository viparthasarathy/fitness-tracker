FactoryGirl.define do
  factory :measurement do
    weight 150.5
    height 90
    waist nil
    chest nil
    bodyfat 15
    association :entry, :factory => :entry
  end
end
