class RecipesController < ApplicationController

    # Build a GET route that returns all recipe names.
    def index
        recipes = Recipe.all
        d = {}
        d["recipeNames"] = Array.new
        recipes.each do |r|
            d["recipeNames"].push(r.name)
        end
        render json: d
    end
end
