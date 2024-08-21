class CreateTrip < ActiveRecord::Migration[7.2]
  def change
    create_table :trips, id: :uuid do |t|
      t.datetime :departure_time, null: false
      t.string :departure_location, null: false
      t.datetime :arriving_time
      t.string :arriving_location
      t.string :estimated_arriving_location
      t.datetime :estimated_arriving_time
      t.string :status, default: :draft

      t.references :boat, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
