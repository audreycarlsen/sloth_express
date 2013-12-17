class AddItemStatusToProduct < ActiveRecord::Migration
  def change
    add_column :products, :item_status, :string
  end
end
