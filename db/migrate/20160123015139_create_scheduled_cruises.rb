class CreateScheduledCruises < ActiveRecord::Migration
  def change
    create_table :scheduled_cruises do |t|

      t.timestamps null: false
      
      t.references :cruise_type, index: true, foreign_key: true
      t.datetime :datetime
      
    end
  end
end
