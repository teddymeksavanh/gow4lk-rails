class CreateStrolls < ActiveRecord::Migration[5.2]
  def change
    create_table :strolls do |t|
      t.string :name
      t.text :description
      t.float :length
      t.string :city
      t.string :country
      t.float :latitude
      t.float :longitude
      t.string :created_by
      
      t.timestamps
    end
  end
end
