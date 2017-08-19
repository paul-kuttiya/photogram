class CreatePostsTags < ActiveRecord::Migration
  def change
    create_table :post_tags do |t|
      t.integer :post_id, :tag_id
    end
  end
end
