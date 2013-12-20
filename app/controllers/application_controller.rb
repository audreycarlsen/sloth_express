class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :featured_product

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_order
    @current_order ||= Order.find(session[:order_id]) if session[:order_id]
  end
  helper_method :current_order

  def featured_product
    legit_photos ||= Product.all.reject { |p| p.photo == "" }
    @featured_product ||= legit_photos.sample
  end

  def cart_size
    order_item_array = OrderItem.all.select { |order_item| order_item.order_id == session[:order_id] }
    order_item_array.each do |order_item|
      size = 0
      order_item.quantity
      size += order_item.quantity
    end
  end
end
