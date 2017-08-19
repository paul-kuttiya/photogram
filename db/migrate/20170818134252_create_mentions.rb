class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.integer :mention_by_id, :mention_at_id, :post_id 
      t.timestamps
    end
  end
end
