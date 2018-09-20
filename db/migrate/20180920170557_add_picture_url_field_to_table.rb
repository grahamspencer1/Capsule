class AddPictureUrlFieldToTable < ActiveRecord::Migration[5.2]
  def change
    add_column :bg_pictures, :image, :string
  end
end
