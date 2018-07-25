class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin      
      t.boolean :is_active
      t.string :picture_seed

      t.timestamps
    end
  end
end
