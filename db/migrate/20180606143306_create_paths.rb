class CreatePaths < ActiveRecord::Migration[5.2]
  def change
    create_table :paths do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.text :description
      t.references :stroll, foreign_key: true      

      t.timestamps
    end
  end
end
