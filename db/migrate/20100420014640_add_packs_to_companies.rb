class AddPacksToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :packs, :integer
  end

  def self.down
    remove_column :companies, :packs
  end
end
