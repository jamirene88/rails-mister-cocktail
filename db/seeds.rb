# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'byebug'



puts "creating ingredients"
url= "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients_page = open(url).read
ingredients = JSON.parse(ingredients_page)

ingredients["drinks"].each do |drink|
  Ingredient.create(name: drink['strIngredient1'])
end
puts "created ingredients"

puts "creating cocktails"
url = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'
cocktails_page = open(url).read
cocktails = JSON.parse(cocktails_page)

cocktails['drinks'].each do |drink|
  Cocktail.create(name: drink["strDrink"])

end
puts "created cocktails"
