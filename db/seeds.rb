# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Plan.find_or_create_by!(name: "Bronze", price_cents: 00)
Plan.find_or_create_by!(name: "Silver", price_cents: 500, stripe_price_id: "price_1LbWYwET8lfOTwqGkD94DDnX")
Plan.find_or_create_by!(name: "Platnium", price_cents: 800, stripe_price_id: "price_1LftW1ET8lfOTwqGjTjZKC7x")
Plan.find_or_create_by!(name: "Gold", price_cents: 1200, stripe_price_id: "price_1LftWdET8lfOTwqGXEqZnoNx")
Plan.find_or_create_by!(name: "Adamantium", price_cents: 1600, stripe_price_id: "price_1LftXIET8lfOTwqGvCdEYP4O")


