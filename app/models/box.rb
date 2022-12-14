class Box < ApplicationRecord
  validates :name, presence: true #, uniqueness: { scope: :user_id, message: "Name for your box needs to be unique." }
  validates :description, presence: true, length: { minimum: 8 }
  has_one_attached :photo
  belongs_to :collection
  has_many :items, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
end
