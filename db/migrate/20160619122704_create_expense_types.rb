class CreateExpenseTypes < ActiveRecord::Migration
  def change
    create_table :expense_types do |t|
      t.string :expense_description
      t.string :provider
      t.string :provider_registration
      t.string :ticket_number
      t.string :issue_date
      t.float :doc_value
      t.float :net_value
      t.references :spent
    end
  end
end
