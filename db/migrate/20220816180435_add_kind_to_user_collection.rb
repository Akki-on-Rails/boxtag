class AddKindToUserCollection < ActiveRecord::Migration[6.1]
  def change
    add_column :user_collections, :kind, :integer
  end
end
