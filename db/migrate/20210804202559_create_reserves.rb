class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|
      t.datetime :data
      t.integer :reserved
      t.references :livin_room, foreign_key: true

      t.timestamps
    end
  end
end
