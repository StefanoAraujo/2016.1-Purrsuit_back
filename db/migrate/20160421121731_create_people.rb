class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer  :actable_id
      t.string :actable_type

      t.string :name
      t.string :gender
      t.string :email
      t.string :age

			t.references :uf

      t.timestamps null: false
    end
  end
end
