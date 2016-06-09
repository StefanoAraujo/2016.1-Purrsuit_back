namespace :parse do

  task deputies: :environment do
    if Deputy.all.length < 1
      Uf.populate_ufs
      Party.parse_parties
      Deputy.parse_deputies
    else
      puts "Base de deputados já populado!"
    end
  end

  task parties: :environment do
    Party.parse_parties
  end

  task quests: :environment do
    Quest.parse_quests
  end

end
