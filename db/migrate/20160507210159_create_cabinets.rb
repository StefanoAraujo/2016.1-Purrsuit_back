class CreateCabinets < ActiveRecord::Migration
  def change
    create_table :cabinets do |t|
        t.string :phone
        t.string :annex
      t.timestamps null: false
    end
  end
end
