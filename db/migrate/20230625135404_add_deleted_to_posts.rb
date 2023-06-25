class AddDeletedToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :deleted, :boolean
  end
end
