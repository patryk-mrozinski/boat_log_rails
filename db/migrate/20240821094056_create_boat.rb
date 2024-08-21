class CreateBoat < ActiveRecord::Migration[7.2]
  def change
    create_table :boats, id: :uuid do |t|
      t.float :length, null: false
      t.float :width, null: false
      t.float :max_draft, null: false
      t.string :type_name, null: false
      t.string :home_port, null: false
      t.string :name, null: false
      t.string :registration, null: false

      t.float :sails_area
      t.float :mast_height

      t.references :owner, type: :uuid, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
