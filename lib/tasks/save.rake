namespace :save do

  task deputies: :environment do
    Deputy.save_xml
  end

  task parties: :environment do
    Party.save_xml
  end

end
