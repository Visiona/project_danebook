class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :body
      t.string :commentable_type
      t.integer :commentable_id

      t.timestamps
    end
    add_index :comments, [:commentable_type, :commentable_id]
  end
end
