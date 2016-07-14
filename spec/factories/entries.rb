FactoryGirl.define do
  factory :entry do
    association :chapter, :factory => :chapter
    day "2016-07-14"
    notes "MyString"
  end
end
