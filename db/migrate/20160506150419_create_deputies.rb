class CreateDeputies < ActiveRecord::Migration
  def change
    create_table :deputies do |t|

      t.string :deputy_name
      t.integer :registration
      t.string :legislation_situation
      t.integer :followers_count, :null => false, :default => 0
      t.string :image_path
      t.references :party
      t.references :uf
    end
  end
end
