class AddPipToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :pip, :string
  end

  def self.down
    remove_column :companies, :pip
  end
end
