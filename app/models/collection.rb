class Collection < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 8 }
  has_many :user_collections, dependent: :destroy
  has_many :boxes

  def owner
    User.joins(:user_collections).find_by(user_collections: { kind: "owner", collection: self })
  end

  def collaborators
    User.joins(:user_collections).where(user_collections: { kind: "collaborator", collection: self })
  end

  include PgSearch::Model
  pg_search_scope :search_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
end
