class Recipes::DetailsController < ApplicationController

    def show
        # retrieve list of ingredients given a valid recipe name
        recipe_name = params[:id]
        d = {}
        d["details"] = {}
        Recipe.all.each do |r|
            if recipe_name == r.name
                d["details"]["ingredients"] = r.ingredients
                d["details"]["numSteps"] = r.instructions.length()
            end
        end

        if d["details"].empty?
            render json: {}
        else
            render json: d
        end
    end
end
