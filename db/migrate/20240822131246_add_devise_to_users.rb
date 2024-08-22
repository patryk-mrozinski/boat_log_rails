# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.2]
  def change
    change_table :users, bulk: true do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""
      t.change :email, :citext, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      # Trackable
      t.datetime :last_sign_in_at
    end

    add_index :users, :reset_password_token, unique: true
  end
end
