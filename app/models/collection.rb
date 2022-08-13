class Collection < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 8 }
  belongs_to :user_collection
  has_many :boxes
end
