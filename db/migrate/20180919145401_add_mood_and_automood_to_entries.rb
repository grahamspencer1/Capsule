class AddMoodAndAutomoodToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :mood, :string
    add_column :entries, :auto_mood, :boolean
  end
end
