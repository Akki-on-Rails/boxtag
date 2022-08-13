class UserCollection < ApplicationRecord
  has_many :users
  has_many :collections
end
