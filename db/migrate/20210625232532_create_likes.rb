class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :liked_tweet, null: false, foreign_key: {to_table: :tweets}
      t.references :liker, null: false, foreign_key: {to_table: :users}
      t.references :liked_user, null:false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
