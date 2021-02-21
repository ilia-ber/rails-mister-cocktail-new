# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
Ingredient.destroy_all
Cocktail.destroy_all
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
list_opt = open(url).read
ingredients = JSON.parse(list_opt)
list = ingredients["drinks"]
sleep 1 
puts "Creating drinks..."
list.each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end
sleep 2 
puts "Finished!"
