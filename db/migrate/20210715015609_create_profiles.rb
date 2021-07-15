class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.text :description
      t.references :user, null:false, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
