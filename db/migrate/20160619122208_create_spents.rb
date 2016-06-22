class CreateSpents < ActiveRecord::Migration
  def change
    create_table :spents do |t|
      t.belongs_to :deputy, index: true
      t.float :total_value
      t.float :air_ticket_cost
      t.float :phone_cost
      t.float :postal_cost
      t.float :office_cost
      t.float :alimentation_cost
      t.float :accommodation_cost
      t.float :vehicle_tenancy_cost
      t.float :gas_cost
      t.float :security_cost
      t.float :contract_cost
      t.float :advertising_cost
      t.float :participation_cost
      t.float :housing_assistance_gost
    end
  end
end
