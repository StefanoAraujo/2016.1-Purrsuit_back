namespace :save do

  task parties: :environment do
    Party.save_xml
  end

end
