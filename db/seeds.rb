# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
25.times do
  Beer.create(
    name: Faker::Beer.name,
    style: Faker::Beer.style,
    hop: Faker::Beer.hop,
    yeast: Faker::Beer.yeast,
    malts: Faker::Beer.malts,
    ibu: Faker::Beer.ibu,
    alcohol: Faker::Beer.alcohol,
    blg: Faker::Beer.blg,
    price: Faker::Commerce.price
  )
end