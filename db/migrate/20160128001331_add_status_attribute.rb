class AddStatusAttribute < ActiveRecord::Migration
  def change
    change_table :reservations do |t|
      t.string :status
    end
    change_table :cruise_types do |t|
      t.string :status
    end
    change_table :scheduled_cruises do |t|
      t.string :status
    end
  end
end
