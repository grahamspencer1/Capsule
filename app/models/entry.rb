class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :bg_picture

  def self.last_five_entry(current_user)
    result = current_user.entries.order('id desc').limit(5)
    return result
  end

  def self.entry_search(date)
    Entry.where("created_at >= ? ", date)
  end

end
