class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :body
      t.string :title
      t.references :author, null: true, foreign_key: {to_table: :users}
      t.references :parent, null: true, foreign_key: {to_table: :tweets}

      t.timestamps
    end
  end
end
