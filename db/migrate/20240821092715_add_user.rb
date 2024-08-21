class AddUser < ActiveRecord::Migration[7.2]
  def change
    create_table :users, id: :uuid do |t|
      t.citext :first_name, null: false
      t.citext :last_name, null: false
      t.citext :email, null: false
      t.string :password_digest, null: false
      
      t.boolean :boat_owner, default: false
      t.string :role

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
