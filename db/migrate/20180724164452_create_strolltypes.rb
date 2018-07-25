class CreateStrolltypes < ActiveRecord::Migration[5.2]
  def change
    create_table :strolltypes do |t|
      t.integer :type_id

      t.references :stroll
      t.timestamps
    end
  end
end
