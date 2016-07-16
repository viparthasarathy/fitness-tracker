FactoryGirl.define do
  factory :measurement do
    weight 1.5
    association :entry, :factory => :entry
  end
end
