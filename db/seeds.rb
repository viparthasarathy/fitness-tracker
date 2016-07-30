# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.create(email: "example@example.com", password: "example", time_zone: 'Eastern Time (US & Canada)')
log = User.first.log

first_chapter = log.chapters.create(goal: -1.0, title: "Diet", description: "I want to lose weight.")
first_chapter.update(created_at: Time.zone.now - 365.days)

90.times do |i|
  entry = first_chapter.entries.create(day: first_chapter.created_at + i.days)
  entry.measurement.create(weight: 200.0 - i/3.0, height: 72.0, waist: 37.0 - i/20.0, chest: 60.0 - i/30.0, bodyfat: 24.5 - i/10.0)
  entry.foods.create(title: "Food for day #{i + 1}", calories: rand(2000..2500), protein: rand(100..150), carbs: rand(100..150), fats: rand(100..150))
end

first_chapter.update(completed_at: first_chapter.created_at + 89.days)

second_chapter = log.chapters.create(goal: 0.5, title: "Gain", description: "I want to put on muscle.")
second_chapter.update(created_at: first_chapter.completed_at + 1.day)

90.times do |i|
  entry = second_chapter.entries.create(day: second_chapter.created_at + i.days)
  measurement = first_chapter.entries.first.measurement
  params = {weight: measurement.weight + i/6.0, height: 72.0, waist: measurement.waist + i/40.0, chest: measurement.chest + i/20.0, bodyfat: measurement.bodyfat + i/20.0}
  entry.measurement.create(params)
  entry.foods.create(title: "Food for day #{i + 1}", calories: rand(2500..3000), protein: rand(125..175), carbs: rand(125..175), fats: rand(125..175))
end

second_chapter.update(completed_at: second_chapter.created_at + 89.days)

third_chapter = log.chapters.create(goal: -1.0, title: "Diet #2", description: "Time to lose weight again.")
third_chapter.update(created_at: second_chapter.completed_at + 1.day)

90.times do |i|
  entry = third_chapter.entries.create(day: third_chapter.created_at + 1.days)
  measurement = second_chapter.entries.first.measurement
  params = {weight: measurement.weight - i/3.0, height: 72.0, waist: measurement.waist - i/20.0, chest: measurement.chest - i/30.0, bodyfat: measurement.bodyfat - i/10.0}
  entry.measurement.create(params)
  entry.foods.create(title: "Food for day #{i + 1}", calories: rand(2000..2500), protein: rand(100..150), carbs: rand(100..150), fats: rand(100..150))
end

third_chapter.update(completed_at: third_chapter.created_at + 89.days)

fourth_chapter = log.chapters.create(goal: 0.0, title: "Maintain", description: "I want to stay the same.")
fourth_chapter.update(created_at: third_chapter.completed_at + 1.day)

90.times do |i|
  entry = fourth_chapter.entries.create(day: fourth_chapter.created_at + 1.days)
  measurement = third_chapter.entries.first.measurement
  params = {weight: measurement.weight - i/90.0, height: 72.0, waist: measurement.waist - i/300.0, chest: measurement.chest - i/400.0, bodyfat: measurement.bodyfat - i/90.0}
  entry.measurement.create(params)
  entry.foods.create(title: "Food for day #{i + 1}", calories: rand(2250..2750), protein: rand(125..150), carbs: rand(125..150), fats: rand(125..150))
end

  
