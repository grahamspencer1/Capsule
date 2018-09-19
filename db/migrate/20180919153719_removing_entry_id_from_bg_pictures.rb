class RemovingEntryIdFromBgPictures < ActiveRecord::Migration[5.2]
  def change
    remove_column :bg_pictures, :entry_id
  end
end
