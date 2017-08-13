class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :location
      t.string :caption
      t.string :image
      t.string :token
      t.integer :user_id
    end
  end
end
