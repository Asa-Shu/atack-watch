class ChangeDeletedDefaultInPosts < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts, :deleted, from: nil, to: false
  end
end
