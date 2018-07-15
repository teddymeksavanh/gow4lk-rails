class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :description
      t.references :user, foreign_key: true
      t.references :stroll, foreign_key: true

      t.timestamps
    end
  end
end
