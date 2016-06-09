class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|

      t.integer :level_number, presence: true
      t.integer :xp_min, presence: true
      t.integer :xp_max, presence: true
      t.string :level_description, presence: true
    end

    Level.create(:level_number => 1, :level_description => "Peixe novo", :xp_max => 99, :xp_min => 0)
    Level.create(:level_number => 2, :level_description => "Novo por aqui", :xp_max => 199, :xp_min => 100)
    Level.create(:level_number => 3, :level_description => "Aprendendo as regras", :xp_max => 299, :xp_min => 200)
    #Level.create(:level_number => 4, :level_description => "Sabe tudo", :xp_max => 449, :xp_min => 300)
    #Level.create(:level_number => 5, :level_description => "Expert", :xp_max => 599, :xp_min => 450)
    #Level.create(:level_number => 6, :level_description => "Guru", :xp_max => 699, :xp_min => 600)

  end
end
