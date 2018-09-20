class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :bg_picture

  validates :title, length: { minimum: 3, maximum: 50 }, presence: true
  validates :content, length: { minimum: 3, maximum: 1500 }, presence: true

  def self.last_five_entry
    result = Entry.order('id desc').limit(5)
    return result
  end

  def self.entry_search(date)
    Entry.where("created_at >= ? ", date)
  end

end
