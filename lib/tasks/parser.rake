namespace :parse do

  task deputies: :environment do
    Deputy.parse_deputies
  end

  task parties: :environment do
    Party.parse_parties
  end

end
