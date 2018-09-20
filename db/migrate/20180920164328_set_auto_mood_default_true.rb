class SetAutoMoodDefaultTrue < ActiveRecord::Migration[5.2]
  def change
    change_column :entries, :auto_mood, :boolean, default: true
  end
end
