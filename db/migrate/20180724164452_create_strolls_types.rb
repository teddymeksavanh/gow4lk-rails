class CreateStrollsTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :strolls_types, id: false do |t|
      t.integer :stroll_id
      t.integer :type_id
    end

    add_index :strolls_types, :stroll_id
    add_index :strolls_types, :type_id
    add_index :strolls_types, [ :stroll_id, :type_id ]
    add_index :strolls_types, [ :stroll_id, :type_id ]
  end
end
