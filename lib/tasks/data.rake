namespace :data do
    desc "Populate database with local JSON file"
    task populate: :environment do
        puts "Populating database with JSON data..."
        recipe_list = JSON.parse(File.read('./data.json'))

        recipe_list.each do |recipe|
            Recipe.create(recipe[1])
        end
    end
end
