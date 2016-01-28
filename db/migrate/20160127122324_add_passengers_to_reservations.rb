class AddPassengersToReservations < ActiveRecord::Migration
  def change
    change_table :reservations do |t|

      t.integer :passengers_adults, default: 0
      t.integer :passengers_seniors, default: 0
      t.integer :passengers_kids, default: 0
      t.integer :passengers_babies, default: 0

    end
  end
end
