class OrderItemsController < ApplicationController

  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
  
  def new
    @order_item = OrderItem.new
  end
  

  def create
    if session[:order_id]
      @order = Order.find(session[:order_id])
    else
      @order = Order.create
      session[:order_id] = @order.id
    end


    # @product = Product.find(params[:product_id])
    # @order_item = OrderItem.new 
    # @order_item.product = @product
    # @order_item.order = @order
    # @order_item.quantity = 1

    if @order_item.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  # def change(request)
  #   OrderItem.change_item_quantity(request)
  # end

  def remove_item
    @order_item = OrderItem.find_by(order_id: current_order.id, product_id: params[:product_id])
    @order_item.destroy
    redirect_to order_path(current_order)
  end



private
  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status, :user_id)
  end

  def order_items_params
    params.require(:order_item).permit(:product_id, :order_id, :quantity)
  end
end

