class UserCollection < ApplicationRecord
  belongs_to :users
  belongs_to :collections
end
