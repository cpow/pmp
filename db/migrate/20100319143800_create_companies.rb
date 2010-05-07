class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.integer :user_id
      t.integer :pip_id
      t.string :name
      t.text :notes
      t.text :urls
      t.string :main_contact
      t.string :main_contact_email
      t.text :usernames

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
