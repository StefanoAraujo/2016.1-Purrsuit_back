class CreateSpents < ActiveRecord::Migration
  def change
    create_table :spents do |t|
      t.belongs_to :deputy, index: true
    end
  end
end
