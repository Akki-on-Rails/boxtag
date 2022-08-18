class Item < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :box_id, message: "This item already exists in your box." }
  belongs_to :box

  include PgSearch::Model
  multisearchable against: [:name]
  PgSearch.multisearch_options = {
    using: {:tsearch => { :prefix => true }}
  }
end
