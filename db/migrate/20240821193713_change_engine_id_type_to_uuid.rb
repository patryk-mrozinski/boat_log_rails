class ChangeEngineIdTypeToUuid < ActiveRecord::Migration[7.2]
  def change
    add_column :engines, :uuid, :uuid, default: "gen_random_uuid()", null: false

    change_table :engines do |t|
      t.remove :id
      t.rename :uuid, :id
    end
    execute "ALTER TABLE engines ADD PRIMARY KEY (id);"
  end
end
