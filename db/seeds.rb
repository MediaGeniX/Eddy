# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
User.create!(name: "Admin", birthdate: Date.today, location: 0, sex: 0, email:'test@mediagenix.tv', password: 'testtest', password_confirmation: 'testtest')
Season.create!(start_date: Date.new(1900), end_date: Date.new(2200), default: true, name: 'Default all')
