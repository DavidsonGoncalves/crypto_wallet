# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



Coin.create!(
  description: "Bitcoin",
  acronym: "BTC",
  url_image: "https://png.pngtree.com/png-clipart/20211212/original/pngtree-bitcoin-png-png-image_6961160.png"
)

Coin.create!(
  description: "Etherium",
  acronym: "ETH",
  url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5JfenCFa1c9KP4-LQZ1TzP-tMMPiXYG1NyQ&s"
)

Coin.create!(
  description: "Dash",
  acronym: "DASH",
  url_image: "https://gallery.yopriceville.com/downloadfullsize/send/21848"
)
