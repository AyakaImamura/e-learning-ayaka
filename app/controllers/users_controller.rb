class UsersController < ApplicationController
  #サインアップページ
  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page:10)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @activities = @user.activities.order(created_at: :desc).paginate(page: params[:page],per_page:6)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
