class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|

      t.timestamps null: false
      
      t.references :scheduled_cruise, index: true, foreign_key: true

      t.string :name
      t.string :address_line_1
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      
      t.string :coupon_code
      t.string :additional_information

    end
  end
end
