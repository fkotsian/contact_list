class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :user_id, null: false
      t.string :commentable_type, null: false
      t.integer :commentable_id, null: false

      t.timestamps
    end
  end
end
