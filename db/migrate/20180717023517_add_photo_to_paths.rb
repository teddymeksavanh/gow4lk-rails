class AddPhotoToPaths < ActiveRecord::Migration[5.2]
  def change
    add_column :paths, :photo, :string
  end
end
