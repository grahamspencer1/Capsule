class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :title
      t.text :content
      t.boolean :private, default: true
      t.integer :bg_picture_id
      t.integer :user_id

      t.timestamps
    end
  end
end
