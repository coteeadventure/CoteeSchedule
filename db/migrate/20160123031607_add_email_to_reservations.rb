class AddEmailToReservations < ActiveRecord::Migration
  def change
    change_table :reservations do |t|

      t.string :email

    end
  end
end
