FactoryGirl.define do
  factory :user do
    email "thegreatestuser@yahoo.com"
    password "heyitsmeuser"
    time_zone Time.zone
  end
end
