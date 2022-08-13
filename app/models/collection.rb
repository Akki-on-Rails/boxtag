class Collection < ApplicationRecord
  belongs_to :user_collection
  has_many :boxes
end
