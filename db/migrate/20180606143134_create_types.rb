class CreateTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |t|
      t.string :name
      t.text :description
      t.string :color
      t.references :stroll, foreign_key: true            

      t.timestamps
    end
  end
end
