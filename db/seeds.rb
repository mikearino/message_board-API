# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Group

  def self.begin
    seed = Seed.new
    seed.generate_groups
end

def genearate_groups
  5.times do |i|
    group = Group.create!(
    topic: Faker::Commerce.department
  )
  puts "Group #{i}: topic is #{group.topic}."
