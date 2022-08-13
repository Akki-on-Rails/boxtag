class Collection < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 8 }
  has_many :user_collections
  has_many :boxes
end
