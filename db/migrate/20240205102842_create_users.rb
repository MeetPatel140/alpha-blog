class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password
      t.string :city
      t.string :country
      t.string :bio
      t.string :website
      t.string :linkedin_profile
      t.string :facebook_profile
      t.string :twitter_profile
      t.string :instagram_profile
      t.boolean :status

      t.timestamps
    end
  end
end
