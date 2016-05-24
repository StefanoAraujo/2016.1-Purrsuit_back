namespace :states do

  task populate: :environment do
    Uf.populate_ufs
  end

end
