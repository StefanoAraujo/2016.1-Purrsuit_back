class AddLastAcessToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_acess, :string
  end
end
