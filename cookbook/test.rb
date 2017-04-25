require_relative "recipe"
require_relative "cookbook"


# Create a new recipe
recipe = Recipe.new("recette x", "Ingrédient x")
# Create a data base
database = Cookbook.new("lib/recipes.csv")
# List database
puts "----------"
p database.all
sleep(2)
# Add recipe into database
puts "----------"
database.add_recipe(recipe)
# List database
p database.all
sleep(2)
# Add recipe into database
puts "----------"
database.remove_recipe_at(0)
# List database
p database.all
