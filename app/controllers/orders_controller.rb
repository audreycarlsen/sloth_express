class OrdersController < ApplicationController

  before_action :set_order, only:[:edit, :show, :update, :destroy]

  def new
    @order = Order.new
  end
  
  def show
    if current_order.products.count == 0
      redirect_to "/orders/empty"
    end

    @total = 0
  end

  # def index
  # end

  def edit
  end

  def create
  end

  def update
  end

  def completed
    set_order
    @order.update(status: "shipped")
    @order.save
    redirect_to user_path(current_user)
  end

  def cancelled
    set_order
    @order.update(status: "cancelled")
    @order.save
    redirect_to user_path(current_user)
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end 

  def order_params
    params.require(:order).permit(:status, :user_id, :products => {})
  end

end
