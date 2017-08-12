class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :full_name
      t.string :password_digest
      t.string :email
      t.string :website
      t.string :bio
      t.timestamps
    end
  end
end
