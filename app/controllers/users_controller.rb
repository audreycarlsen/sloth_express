class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # force_ssl

  def index
    @users = User.all
  end

  def show
    @products = Product.where(:user_id => current_user.id)
  end

  def new
    @user = User.new
  end

  def edit
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
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
