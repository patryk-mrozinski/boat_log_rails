class CreateCourse < ActiveRecord::Migration[7.2]
  def change
    create_table :courses, id: :uuid do |t|
      t.datetime :departure_time, null: false
      t.string :departure_location, null: false
      t.datetime :arriving_time
      t.string :arriving_location
      t.string :sailing_number
      t.string :sailing_type
      t.string :stopover_in
      t.text :comments

      t.references :boat, type: :uuid, foreign_key: true
      t.references :trip, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
