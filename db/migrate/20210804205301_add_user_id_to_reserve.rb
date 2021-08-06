class AddUserIdToReserve < ActiveRecord::Migration[5.2]
  def change
    add_reference :reserves, :user, foreign_key: true
  end
end
