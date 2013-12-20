class RemoveDefaultPhotoFromProducts < ActiveRecord::Migration
  def change
    change_column :products, :photo, :string, :default => nil
  end
end
