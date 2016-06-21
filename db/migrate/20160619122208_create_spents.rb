class CreateSpents < ActiveRecord::Migration
  def change
    create_table :spents do |t|
      t.belongs_to :deputy, index: true
      t.string :deputy_name_spent
      t.float :total_value
      t.float :office_cost
      t.float :gas_cost
      t.float :ad_cost
      t.float :phone_cost
      t.float :postal_cost
      t.float :vehicle_tenancy
      t.float :air_ticket
    end
  end
end
