class CreateBoatUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :boat_users do |t|
      t.references :boat, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    # prevent duplicate entries
    add_index :boat_users, [:boat_id, :user_id], unique: true
  end
end
