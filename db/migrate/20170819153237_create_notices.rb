class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.integer :from_id, :to_id, :noticeable_id
      t.string :noticeable_type
      t.boolean :mark, default: false
      t.timestamps
    end
  end
end
