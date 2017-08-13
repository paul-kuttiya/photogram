class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :location
      t.string :caption
      t.string :image
      t.string :token
    end
  end
end
