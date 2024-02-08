class AddRequiredColumnsInTableUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :bio, :string
    add_column :users, :website, :string
    add_column :users, :linkedin_profile, :string
    add_column :users, :facebook_profile, :string
    add_column :users, :twitter_profile, :string
    add_column :users, :instagram_profile, :string
    add_column :users, :account_status, :boolean
  end
end
