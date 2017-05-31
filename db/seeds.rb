# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

usernames = ["Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot"]

usernames.each do |username|
  user = User.create
  user.username = username
  user.email = "#{username}@america.com"
  user.password = "12341234"
  user.save
end

puts "There are now #{User.count} users in the database."
