# ingredients and instructions data type code from here:
# https://stackoverflow.com/questions/17731057/array-field-not-being-recognized-as-attribute
class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients, array: true, default: '{}'
      t.string :instructions, array: true, default: '{}'

      t.timestamps
    end
  end
end
