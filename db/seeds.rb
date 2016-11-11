# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first
ingredients = JSON.parse(open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)['drinks']
ingredients.each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
product = Cocktail.new(name: 'NES')
product.remote_photo_url = url
product.save
