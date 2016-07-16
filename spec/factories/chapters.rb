FactoryGirl.define do
  factory :chapter do
    goal -0.5
    title "Diet"
    description "This is a very nice chapter."
    association :log, :factory => :log
    completed_at nil
  end

  after :create do |chapter|
    chapter.update(created_at: Time.zone.today - 5)
  end
end
