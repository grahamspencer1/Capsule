class User < ApplicationRecord
  has_secure_password
  has_many :entries

  validates :name, presence: true, on: :create
  validates :password, length: { minimum: 8, maximum: 50 }, presence: true, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email, uniqueness: true

  def self.next_entry(current_entry, entries)
    current_index = entries.index(current_entry)
    if current_index == (entries.length-1)
      next_entry = entries.first
    else
      next_entry = entries[current_index + 1]
    end
    return next_entry
  end

  def self.previous_entry(current_entry, entries)
    current_index = entries.index(current_entry)
    previous_entry = nil
    if (current_index - 1) >= 0
      previous_entry = entries[current_index - 1]
    elsif current_index == 0
      previous_entry = entries.last
    end
    return previous_entry
  end
end
