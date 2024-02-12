class RemoveColumnFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :city
    remove_column :users, :country
    remove_column :users, :bio
    remove_column :users, :website
    remove_column :users, :linkedin_profile
    remove_column :users, :facebook_profile
    remove_column :users, :instagram_profile
    remove_column :users, :twitter_profile
  end
end
