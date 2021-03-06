class RecipesController < ApplicationController
    ALLOWED_DATA = %[name ingredients instructions].freeze

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

    # Add a POST route that can add additional recipes in the 
    # existing format to the backend with support for the above routes.
    def create
        puts "POST function in recipes_controller reached ..."
        recipes = Recipe.all
        recipeNames = []
        recipes.each do |r|
            recipeNames.push(r.name)
        end

        # ingest JSON from client
        data = json_payload.select {|k| ALLOWED_DATA.include?(k)}

        # check to see if recipe already exists
        if recipeNames.include? data["name"]
            render json: {"status": 400, "error": "Recipe already exists"}, :status => :bad_request
        else
            recipe = Recipe.new(data)
            recipe.save
            render json: recipe
        end
    end

    def destroy
        recipe = Recipe.find(params[:id])
        recipe.destroy
    end

    # Add a PUT route that can update existing recipes.
    # take name as param, so route looks smth like recipes/butteredBagel
    def update
        recipeName = params[:id]
        recipes = Recipe.all
        data = json_payload.select {|k| ALLOWED_DATA.include?(k)}
        doesRecipeExist = false

        # if recipeName exists in recipes, update recipes[recipeName] with PUT data
        recipes.each do |r|
            if r.name == recipeName
                r.ingredients = data["ingredients"]
                r.instructions = data["instructions"]
                doesRecipeExist = true
            end
        end

        if !doesRecipeExist
            render json: {"error": "Recipe does not exist"}, :status => :not_found
        end
    end
end
