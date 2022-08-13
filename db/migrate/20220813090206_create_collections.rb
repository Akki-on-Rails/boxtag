class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.string :name
      t.string :description
      t.references :user_collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
