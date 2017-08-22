class AddPostToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :post_id, :integer
  end
end
