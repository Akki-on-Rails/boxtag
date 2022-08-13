class CreateBoxes < ActiveRecord::Migration[6.1]
  def change
    create_table :boxes do |t|
      t.string :name
      t.string :description
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
