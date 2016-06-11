class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|

      t.integer :level_number, presence: true
      t.integer :xp_min, presence: true
      t.integer :xp_max, presence: true
      t.string :level_description, presence: true
    end

  end
end
