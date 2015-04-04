class UsersController < ApplicationController
  respond_to :html, :xml, :json
  before_action :authenticate_user!
  before_action :authorized?
  load_and_authorize_resource

  def index
    @users = User.all.order("email")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    flash[:notice] = 'User was successfully created.' if @user.save
    respond_with(@user, location: users_url)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
    @user = User.find(params[:id])
    flash[:notice] = "Successfully updated user." if @user.update_attributes(user_params)
    respond_with(@user, location: users_url)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to users_url
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :role, :password, :password_confirmation)
    end
end
