class AddOrderDefaultValues < ActiveRecord::Migration
  def change
    change_column :order_items, :quantity, :integer, :default => 1
    change_column :orders, :status, :string, :default => "pending"
  end
end
