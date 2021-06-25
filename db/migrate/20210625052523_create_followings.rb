class CreateFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :followings do |t|

      t.references :follower, foreign_key: {to_table: :users}, null: false
      t.references :followed_user, foreign_key: {to_table: :users}, null: false
      t.timestamps
    end
  end
end
