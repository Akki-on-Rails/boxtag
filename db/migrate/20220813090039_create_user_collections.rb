class CreateUserCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :user_collections do |t|

      t.timestamps
    end
  end
end
