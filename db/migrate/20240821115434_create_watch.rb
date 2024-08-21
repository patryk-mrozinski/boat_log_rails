class CreateWatch < ActiveRecord::Migration[7.2]
  def change
    create_table :watches, id: :uuid do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time
      t.string :number

      t.references :boat, type: :uuid, foreign_key: true
      t.references :trip, type: :uuid, foreign_key: true
      t.references :course, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
