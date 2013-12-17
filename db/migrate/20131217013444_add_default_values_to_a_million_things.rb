class AddDefaultValuesToAMillionThings < ActiveRecord::Migration
  def change
    change_column :products, :item_status, :string, :default => "active"
  end
end
