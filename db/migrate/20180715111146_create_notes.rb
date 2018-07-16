class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :description
      t.string :created_by
      t.references :stroll, foreign_key: true

      t.timestamps
    end
  end
end
