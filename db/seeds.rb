# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do
  Caffeine.create(blend_name: Faker::Coffee.blend_name, origin: Faker::Coffee.origin, variety: Faker::Coffee.variety, notes: Faker::Coffee.notes)
end

15.times do
  random_id = rand(1..Caffeine.all.length)
  Lovecraft.create(deity: Faker::Lovecraft.deity, tome: Faker::Lovecraft.tome, location: Faker::Lovecraft.location, word: Faker::Lovecraft.word, sentence: Faker::Lovecraft.sentence, caffeine_id: random_id)
end
