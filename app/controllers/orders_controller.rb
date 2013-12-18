class OrdersController < ApplicationController

  before_action :set_order, only:[:edit, :show, :update, :destroy]

  def new
    @order = Order.new
  end
  
  def show
  end

  # def index
  # end

  def edit
  end

  def create
  end

  def update
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end 

  def order_params
    params.require(:order).permit(:status, :user_id, :products => {})
  end

  def subtotal
  end


end
