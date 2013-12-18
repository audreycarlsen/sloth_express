class PurchasesController < ApplicationController

  def new
    @purchase = Purchase.new
  end

  def show
    @purchase = Purchase.find(params[:id])
    @total = 0
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @order_items = OrderItem.where(order_id: session[:order_id])

    if @purchase.save
      @order_items.each do |order_item|
        order_item.product.stock -= order_item.quantity
        if order_item.product.stock == 0
          order_item.product.update(item_status: "retired")
        end
        order_item.product.save
      end
      current_order.status = "Paid"
      current_order.save
      session[:order_id] = nil

      redirect_to purchase_path(@purchase.id), notice: 'Thank you for your order!'
    else
      redirect_to purchase_path(@purchase.id), notice: 'Your order was not completed. Please try again!'
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:email, :address, :name, :cc_number, :cvv, :zipcode, :expiration_month, :expiration_year, :order_id, :product_id)
  end
end