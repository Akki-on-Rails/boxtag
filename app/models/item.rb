class Item < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :box_id, message: "This item already exists in your box." }
  belongs_to :box

  include PgSearch::Model
  pg_search_scope :search_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
end
