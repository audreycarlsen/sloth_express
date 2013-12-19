class AddDefaultPictureToProduct < ActiveRecord::Migration
  def change
    change_column :products, :photo, :string, :default => "sloth_default.png"
  end
end
