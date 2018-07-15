class AddGalleryToStrolls < ActiveRecord::Migration[5.2]
  def change
    add_column :strolls, :gallery, :string
  end
end
