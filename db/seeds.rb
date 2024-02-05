# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(name: "Rose", email: "rose@email.com", password: "password", password_confirmation: "password", image_url: "https://wallpapers.com/images/hd/aesthetic-anime-profile-pictures-c5kiw7fwmgo8l90y.jpg")

User.create(name: "Noah", email: "noah@email.com", password: "password", password_confirmation: "password", image_url: "https://www.boredpanda.com/blog/wp-content/uploads/2021/12/coolest-anime-characters-36-61b1e0e2e5921__700.jpg")

User.create(name: "Dan", email: "dan@email.com", password: "password", password_confirmation: "password", image_url: "https://i.pinimg.com/originals/2a/92/06/2a9206a4a0d1d23cf92636c42115d054.jpg", admin: true)

User.create(name: "Mia", email: "mia@email.com", password: "password", password_confirmation: "password", image_url: "https://images.saymedia-content.com/.image/t_share/MTc2MjcxMzYwNDU1NjE1NjYx/the-coolest-and-hottest-female-anime-characters.jpg", admin: true)