# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

product_names = ["Guitar", "Record Player", "Stereo", "MIDI Interface", ]

product_names.each do |name|
  Product.create(
    title: name,
    description: Faker::Lorem.sentence,
    additional_details: Faker::Lorem.paragraph,
    cost_cents: rand(10000),
    quantity_in_stock: rand(200)
  )
end
