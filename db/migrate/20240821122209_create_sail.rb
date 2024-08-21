class CreateSail < ActiveRecord::Migration[7.2]
  def change
    create_table :sails, id: :uuid  do |t|
      t.string :type_name, null: false
      t.float :area, null: false
      t.string :marks

      t.references :boat, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
