class Admin::UsersController < ApplicationController
  before_action :check_admin

  def index
    @users = User.paginate(page: params[:page], per_page:10)
  end

  def update #add user as admin
    @user = User.find(params[:id])
    @user.update_attribute(:is_admin, true)

    redirect_to admin_users_url
  end

  def destroy #remove user as admin
    @user = User.find(params[:id])
    @user.update_attribute(:is_admin, false)

    redirect_to admin_users_url
  end

end