class CreateRetweets < ActiveRecord::Migration[6.1]
  def change
    create_table :retweets do |t|
      t.references :retweeted_tweet, null: false, foreign_key: {to_table: :tweets}
      t.references :retweeter, null: false, foreign_key: {to_table: :users}
      t.references :retweeted_user, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
