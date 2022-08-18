class UserCollection < ApplicationRecord
  belongs_to :user
  belongs_to :collection

  enum kind: { owner: 0, collaborator: 1 }, _prefix: true
end
