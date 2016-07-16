FactoryGirl.define do
  factory :entry do
    association :chapter, :factory => :chapter
    day Time.zone.today - 2
    notes "MyString"
  end
end
