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
  {
    name: "Lex Luthor",
    location: "Metropolis",
    killed: false,
    avatar_url: "https://upload.wikimedia.org/wikipedia/en/c/c7/SmallvilleLex.jpg",
  },
  {
    name: "Magneto",
    location: "Genosha",
    killed: false,
    avatar_url: "https://avatarfiles.alphacoders.com/118/11829.jpg",
  },
  {
    name: "Le Bouffon Vert",
    location: "New York",
    killed: false,
    avatar_url: "https://img.livraddict.com/covers/517/517121//couv26356811.jpg",
  },
  {
    name: "Le Pingouin",
    location: "Gotham City",
    killed: false,
    avatar_url: "https://batman-univers.fr/wp-content/uploads/2024/03/1710423288_Danny-DeVito-est-pret-a-redevenir-le-Pingouin.jpg",
  },
  {
    name: "Palpatine (Empereur)",
    location: "Coruscant",
    killed: false,
    avatar_url: "https://img.planete-starwars.com/upload/databank/1/Emperor.jpg",
  },
  {
    name: "Hans Gruber",
    location: "Los Angeles (Nakatomi Plaza)",
    killed: false,
    avatar_url: "http://www.moon-city-garbage.agency/diehard/die37.jpg",
  },
  {
    name: "Norman Bates",
    location: "Bates Motel",
    killed: false,
    avatar_url: "https://i1.sndcdn.com/artworks-Z96oVch7esg7BvEW-dqW4ag-t500x500.jpg",
  },
  {
    name: "Anton Chigurh",
    location: "Texas",
    killed: false,
    avatar_url: "https://fr.web.img4.acsta.net/newsv7/21/01/12/14/50/4547284.jpg",
  },
  {
    name: "Pennywise",
    location: "Derry, Maine",
    killed: false,
    avatar_url: "https://static1.terrafemina.com/articles/0/26/60/80/@/272235-le-clown-de-ca-il-est-revenu-joue-1200x0-1.jpg",
  }
]

contracts.shuffle.each do |contract_data|
  Contract.create!(contract_data)
end

puts "Contracts created!"
