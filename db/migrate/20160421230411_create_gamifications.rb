class CreateGamifications < ActiveRecord::Migration
  def change
    create_table :gamifications do |t|
			t.integer :actable_id
			t.string :actable_type

			t.string :name
			t.integer :experience_points
			t.string :description
			
      t.timestamps null: false
    end
  end
end
