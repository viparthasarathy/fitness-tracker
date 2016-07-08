FactoryGirl.define do
  factory :log do
    association :user, :factory => :user
  end
end
