class CreateMentionings < ActiveRecord::Migration[6.1]
  def change
    create_table :mentionings do |t|
      t.references :mentioned_user, null: false, foreign_key: {to_table: :users}
      t.references :mentioner, null: false, foreign_key: {to_table: :users}
      t.references :tweet, null: false, foreign_key: {to_table: :tweets}

      t.timestamps
    end
  end
end
