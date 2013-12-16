class OrderItemsController < ApplicationController

  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
  
  def new
    @order_item = OrderItem.new
  end
  

  def create
    @order_item = OrderItem.find(params[:id])

    unless session[:order_id]
      @order = Order.new(order_params)
    end
      @order_item = OrderItem.new(order_id: session[:order_id], product_id: params[:product_id])
      render :new
  end

end

private
  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

