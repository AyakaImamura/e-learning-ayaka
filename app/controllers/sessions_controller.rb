class SessionsController < ApplicationController
  #新規作成
  def new
  end

  #データをセーブ
  #ユーザーの情報が正しかったらshowpageに飛ばして、正しくなければnewに飛ばす
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user #Goes to show page
    else
      render 'new'
    end
  end

  #サインアウト
  def destroy
    log_out
    redirect_to root_url
  end
end