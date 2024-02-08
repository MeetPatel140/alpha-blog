class CkeditorAssets < ActiveRecord::Migration[7.1]
  def change
    drop_table :ckeditor_assets
  end
end
