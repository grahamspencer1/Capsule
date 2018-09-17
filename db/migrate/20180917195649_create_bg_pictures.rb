class CreateBgPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :bg_pictures do |t|
      t.integer :entry_id
      t.string :mood

      t.timestamps
    end
  end
end
