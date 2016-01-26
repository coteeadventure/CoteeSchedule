class CreateCruises < ActiveRecord::Migration
  def change
    create_table :cruises do |t|
      t.string :Types
      t.text :text

      t.timestamps null: false
    end
  end
end
