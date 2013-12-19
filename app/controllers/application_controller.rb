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
end
