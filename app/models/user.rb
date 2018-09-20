class User < ApplicationRecord
  has_secure_password
  has_many :entries

  validates :name, presence: true, on: :create
  validates :password, length: { minimum: 8, maximum: 50 }, presence: true, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email, presence: true, uniqueness: true
end
