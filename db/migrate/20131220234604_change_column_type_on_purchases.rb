class ChangeColumnTypeOnPurchases < ActiveRecord::Migration
  def change
    # This didn't wrk and its Kerri's fault
    # if !Rails.env.producton?
    #   change_column :purchases, :order_id, :integer
    # end
  end
end
