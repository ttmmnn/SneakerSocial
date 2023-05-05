class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.string :title,              null: false, default: ""
      t.text :body,                 null: false, default: ""
      t.integer :user_id,           null: false, default: ""
      t.timestamps
    end
  end
end
