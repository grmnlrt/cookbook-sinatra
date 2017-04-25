# this class is used as a service object

require 'open-uri'
require 'nokogiri'

class Parsing
  def search_recipe(ingredient)
    recipe_list = []
    url_part = ingredient.gsub(" ", "-")
    html_file = open("http://www.marmiton.org/recettes/recherche.aspx?s=#{url_part}&type=all")
    html_doc = Nokogiri::HTML(html_file, nil, Encoding::UTF_8.to_s)
    html_doc.search('.m_contenu_resultat').each do |recipe|
      name = recipe.search('.m_titre_resultat a').text
      description = recipe.search('.m_texte_resultat').text.strip
      cooking_time = recipe.search('.m_detail_time div:first-child').text.strip
      difficulty = recipe.search('.m_detail_recette').text.split(" - ")[2]
      recipe_list << { name: name, description: description, cooking_time: cooking_time, difficulty: difficulty }
    end
    return recipe_list
  end
end
