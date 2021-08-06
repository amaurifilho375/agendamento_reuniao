class CreateLivinRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :livin_rooms do |t|
      t.string :name

      t.timestamps
    end
  end
end
