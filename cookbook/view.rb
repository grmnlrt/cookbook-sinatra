class View
  def display(recipes)
    # display all recipes
    puts "-- Here are all your recipes --\n\n"
    recipes.each_with_index do |recipe, index|
      name = recipe.name == "" ? "" : " #{recipe.name}"
      description = recipe.description  == "" ? "" : " | #{recipe.description}"
      cooking_time = recipe.cooking_time == "" ? "" : " (#{recipe.cooking_time})"
      done = recipe.done == true ? "[X] " : "[ ] "
      difficulty = recipe.difficulty == "" ? "" : " [#{recipe.difficulty}]"
      puts "#{done}#{index + 1}.#{name}#{description}#{cooking_time}#{difficulty}"
    end
    puts "\n-------------------------------"
  end

  def ask_user(string)
    # ask user for recipe name
    puts "\n-------------------------------"
    puts "#{string.capitalize}?"
    print "> "
    gets.chomp
  end

  def ask_user_index(index)
    # ask user recipe index to delete it
    puts "\n-------------------------------"
    puts "#{index.capitalize}?"
    print "> "
    gets.chomp.to_i - 1
  end

  def display_web_results(list, ingredient)
    # display web results from marmiton
    puts "Looking for [#{ingredient.gsub(' ', ' et ')}] on [Marmiton]...
    #{list.size} results found!"
    list.each_with_index do |recipe, index|
      name = recipe[:name] == "" ? "" : " #{recipe[:name]}"
      description = recipe[:description]  == "" ? "" : " | #{recipe[:description]}"
      cooking_time = recipe[:cooking_time] == "" ? "" : " (#{recipe[:cooking_time]})"
      difficulty = recipe[:difficulty] == "" ? "" : " [#{recipe[:difficulty]}]"
      puts "#{index + 1}.#{name}#{description}#{cooking_time}#{difficulty}"
    end
  end
end
