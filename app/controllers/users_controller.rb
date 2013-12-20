class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :order]

  # force_ssl

  def index
    @users = User.all
  end

  def show
    @orders = Order.where(:user_id => @user.id)

    if current_user
      @sales_to_show = case params[:sales_filter].to_i
                       when 2
                         current_user.sales_by_status("paid")
                       when 3
                         current_user.sales_by_status("shipped")
                       when 4
                         current_user.sales_by_status("cancelled")
                       else
                         current_user.sales_but_not_pending
                       end
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def order
    @order = Order.find(params[:order_id])
    @purchase = Purchase.find_by(order_id: @order.id)
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created'}
        format.json { render action: 'show', status: :created, location: @user }
        session[:user_id] = @user.id
      else
        format.html { render action: 'new'}
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User info was successfully updated'}
      else
        format.html { render action: 'edit'}
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to users_url}
    end
  end

  def vendors
    @users = User.vendors
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :order_id)
  end
end
