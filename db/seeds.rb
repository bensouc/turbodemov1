# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Destroying all records..."
User.destroy_all
Contract.destroy_all

puts "Creating users..."
leon = User.create!(first_name: "Léon", email: "leon@pro.com", password: "secret")
leon.avatar_url = "https://res.cloudinary.com/bensoucdev/image/upload/v1731753350/VROADSTUDIO/leon_cx5r0g.png"
leon.save!
james = User.create!(first_name: "James", email: "james@007.com", password: "secret")
james.avatar_url = "https://res.cloudinary.com/bensoucdev/image/upload/v1731753350/VROADSTUDIO/james_h8aa7y.png"
james.save!

puts "Users created!"
# https://res.cloudinary.com/bensoucdev/image/upload/v1646901471/VROADSTUDIO/logoVRS-V1_aa8x0l.png
# https://res.cloudinary.com/bensoucdev/image/upload/v1731753350/VROADSTUDIO/james_h8aa7y.png
# https://res.cloudinary.com/bensoucdev/image/upload/v1731753350/VROADSTUDIO/leon_cx5r0g.png

puts "Creating contracts..."
# db/seeds.rb



contracts = [
  {
    name: "Mission impossible : Solomon Lane",
    location: "Paris",
    killed: false,
    avatar_url: "https://static1.srcdn.com/wordpress/wp-content/uploads/11-Solomon-Lane-Mission-Impossible-5-Rogue-Nation.jpg",
  },
  {
    name: "Le Joker : Gotham City",
    location: "Gotham City",
    killed: false,
    avatar_url: "https://upload.wikimedia.org/wikipedia/en/9/98/Joker_%28DC_Comics_character%29.jpg",
  },
  {
    name: "Dark Vador : Star Wars",
    location: "Death Star",
    killed: false,
    avatar_url: "https://www.shutterstock.com/image-vector/darth-vader-helmet-logo-universe-260nw-2338275425.jpg",
  },
  {
    name: "Thanos : Avengers",
    location: "Titan",
    killed: false,
    avatar_url: "https://www.bedetheque.com/media/Couvertures/Couv_244394.jpg",
  },
  {
    name: "Hannibal Lecter : Le Silence des Agneaux",
    location: "Baltimore",
    killed: false,
    avatar_url: "https://i.etsystatic.com/5175241/r/il/4dc83b/2130220528/il_570xN.2130220528_bung.jpg",
  },
  {
    name: "Lord Voldemort : Harry Potter",
    location: "Poudlard",
    killed: false,
    avatar_url: "https://upload.wikimedia.org/wikipedia/en/a/a3/Lordvoldemort.jpg",
  },
]

contracts.shuffle.each do |contract_data|
  Contract.create!(contract_data)
end

puts "Contracts created!"
