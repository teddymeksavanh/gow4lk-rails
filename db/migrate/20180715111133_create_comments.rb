class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :description
      t.string :created_by
      t.references :stroll

      t.timestamps
    end
  end
end
