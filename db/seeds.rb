# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Restaurant.destroy_all
Review.destroy_all

puts "Creating restaurants..."
dal_cavaliere = {name: "Dal Cavaliere", address: "Weißenburger Straße 1", phone_number: "+49 1234 5678", category: "italian"}
cafe_miu = {name: "Café Miu", address: "Sedanstraße 39, 81667 München", phone_number: "+49 1234 9978", category: "chinese"}
giesinger_stehausschank = {name: "Giesinger Bräu - Stehausschank", address: "Prälat-Zistl-Straße 4, 80331 München", phone_number: "+49 1111 3333", category: "japanese"}
plaenty_sandwiches = {name: "plänty SANDWICHES", address: "Altheimer Eck 9, 80331 München", phone_number: "+49 999 1111", category: "japanese"}
tahdig = {name: "Tahdig", address: "Thierschstraße 35, 80538 München", phone_number: "+49 222222", category: "japanese"}

[dal_cavaliere, cafe_miu, giesinger_stehausschank, plaenty_sandwiches, tahdig].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  nice = { rating: 4, content: "War geil", restaurant: restaurant}
  shit = { rating: 2, content: "Geht besser", restaurant: restaurant}
  puts "Created #{restaurant.name}"
  [nice, shit].each do |rev|
    review = Review.create!(rev)
    puts "#{restaurant.name}: #{review.content}"
  end
  end
