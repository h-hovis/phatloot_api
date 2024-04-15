# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[ 
    {
        "name": "Dice Set",
        "category": "Dice",
        "price": 10.00,
        "description": "A set of 7 polyhedral dice for tabletop roleplaying games.",
        "image_url": "http://source.unsplash.com/200x200/?dice"
    },
    {
        "name": "Player's Handbook",
        "category": "Books",
        "price": 50.00,
        "description": "The essential reference for every Dungeons & Dragons player.",
        "image_url": "http://source.unsplash.com/200x200/?book"
    }
]