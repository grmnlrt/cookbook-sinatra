require 'csv'
require_relative 'recipe'

class Cookbook
  attr_reader :tab_recipes
  def initialize(recipe_csv_path)
    @recipes_path = recipe_csv_path
    @tab_recipes = []
    parsing_csv
  end

  def all
    # list all recipe in recipes.csv
    @tab_recipes.each do |recipe|
      recipe
    end
  end

  def add_recipe(recipe)
    # add a recipe in our cookbook
    @tab_recipes << recipe
    storing_csv
  end

  def remove_recipe(recipe_id)
    # remove recipe in our cookbook
    @tab_recipes.delete_at(recipe_id)
    storing_csv
  end

  def mark_as_done_recipe(recipe_id)
    # remove recipe in our cookbook
    @tab_recipes[recipe_id].mark_as_done!
    storing_csv
  end

  private

  def parsing_csv
    # list all recipe in recipes.csv and add it into our cookbook
    CSV.foreach(@recipes_path) do |row|
      @tab_recipes << Recipe.new({ name: row[0], description: row[1], cooking_time: row[2], done: row[3], difficulty: row[4] })
    end
  end

  def storing_csv
    # save cookbook modifications into our csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@recipes_path, 'wb', csv_options) do |csv|
      @tab_recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.cooking_time, recipe.done, recipe.difficulty]
      end
    end
  end
end
