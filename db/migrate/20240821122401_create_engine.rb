class CreateEngine < ActiveRecord::Migration[7.2]
  def change
    create_table :engines do |t|
      t.string :type_name, null: false
      t.integer :power, null: false
      t.string :brand, null: false

      t.references :boat, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
