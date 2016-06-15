class AddImageUrlToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :image_url, :string
  end
end
