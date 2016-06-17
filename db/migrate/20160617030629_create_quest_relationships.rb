class CreateQuestRelationships < ActiveRecord::Migration
  def change
    create_table :quest_relationships do |t|
      t.integer :challenger_id
      t.integer :challenged_id

      t.timestamps null: false
    end

    add_index :quest_relationships, :challenger_id
    add_index :quest_relationships, :challenged_id
    add_index :quest_relationships, [:challenger_id, :challenged_id], unique: true
  end
end
