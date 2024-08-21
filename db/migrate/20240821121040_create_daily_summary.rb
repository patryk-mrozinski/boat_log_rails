class CreateDailySummary < ActiveRecord::Migration[7.2]
  def change
    create_table :daily_summaries, id: :uuid  do |t|
      t.integer :time_on_sails, null: false
      t.integer :time_on_engine, null: false
      t.datetime :time_position_lights_on
      t.datetime :time_position_lights_off
      t.integer :standstill_time
      t.text :description

      t.references :boat, type: :uuid, foreign_key: true
      t.references :trip, type: :uuid, foreign_key: true
      t.references :course, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
