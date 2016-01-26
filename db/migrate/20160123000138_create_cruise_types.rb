class CreateCruiseTypes < ActiveRecord::Migration
  def change
    create_table :cruise_types do |t|
      t.string :name
      t.integer :capacity

      t.timestamps null: false
    end
  end
end
