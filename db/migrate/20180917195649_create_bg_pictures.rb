class CreateBgPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :bg_pictures do |t|
      t.string :mood
      t.string :image

      t.timestamps
    end
  end
end
