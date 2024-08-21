class CreateLogEntry < ActiveRecord::Migration[7.2]
  def change
    create_table :log_entries, id: :uuid do |t|
      t.integer :course_angle, null: false
      t.string :see_condition, null: false
      t.float :boat_speed, null: false

      t.integer :compass_heading
      t.string :declination
      t.string :deviation
      t.string :wind_correction
      t.string :sea_current_correction
      t.string :log_indication
      t.string :used_sails_mark
      t.string :used_engine_information
      t.string :wind_power
      t.string :clouds_and_rain
      t.integer :barometric_pressure
      t.integer :temperature

      t.string :visibility

      t.references :boat, type: :uuid, foreign_key: true
      t.references :trip, type: :uuid, foreign_key: true
      t.references :course, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
