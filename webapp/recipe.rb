class Recipe
  attr_reader :name, :description, :cooking_time, :done, :difficulty
  def initialize(hash = { done: false })
    @name = hash[:name]
    @description = hash[:description]
    @cooking_time = hash[:cooking_time]
    @done = hash[:done] == "true" ? true : false
    @difficulty = hash[:difficulty]
  end

  def mark_as_done!
    @done = true
  end
end
