class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.integer :experience_points, :null => false, :default => 0
      t.boolean :role_admin, :null => false, :default => false
      t.references :uf

    end
  end
end
