require_relative "recipe"
require_relative "view"
require_relative "parsing"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
    @parsing = Parsing.new
  end

  def list
    # display recipes with our private method
    display_recipes
  end

  def create
    # display recipes with our private method
    display_recipes
    # View ask name
    name = @view.ask_user("recipe's name")
    # View ask description
    description = @view.ask_user("recipe's description")
    # View ask for cooking_time
    cooking_time = @view.ask_user("recipe's cooking time")
    # View ask for cooking_time
    difficulty = @view.ask_user("difficulty level")
    # Create a new recipe with this informations
    recipe = Recipe.new({ name: name, description: description, cooking_time: cooking_time, difficulty: difficulty })
    # Add the new recipe in @cookbook
    @cookbook.add_recipe(recipe)
    # display recipes with our private method
    display_recipes
  end

  def destroy
    # display recipes with our private method
    display_recipes
    # View ask index to delete
    recipe_index = @view.ask_user_index("index to delete")
    # destroy a recipe in cookbook
    @cookbook.remove_recipe(recipe_index)
  end

  def import
    # View ask ingredient to seach
    ingredient = @view.ask_user("ingredient to search")
    # Search on marmiton
    web_results = @parsing.search_recipe(ingredient)
    # View create a display of web_results
    @view.display_web_results(web_results, ingredient)
    # View ask recipe to import
    web_results_to_import = @view.ask_user_index("Please type a number to choose which recipe to import")
    # Create new recipe with user choice
    new_recipe = Recipe.new(web_results[web_results_to_import])
    # Add the new recipe in @cookbook
    @cookbook.add_recipe(new_recipe)
    # display recipes with our private method
    display_recipes
  end

  def done
    # display recipes with our private method
    display_recipes
    # View ask ask recipe to mark as done
    recipe_id = @view.ask_user_index("index to mark as done")
    # controller mark as done recipe
    @cookbook.mark_as_done_recipe(recipe_id)
    # display recipes with our private method
    display_recipes
  end

  private

  def display_recipes
    # list all recipe in cookbook
    recipes = @cookbook.all
    @view.display(recipes)
  end
end
