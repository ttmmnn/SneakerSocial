class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.integer :user_id,            null: false, default: ""
      t.integer :post_id,            null: false, default: ""
      t.text :comment_content,       null: false, default: ""
      t.timestamps
    end
  end
end
