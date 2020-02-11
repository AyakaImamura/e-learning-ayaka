module SessionsHelper
  #入力されたユーザーのidを探し出しログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  #現在ログインしているユーザーがいる場合、ユーザーを復元？
  def current_user
    if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
        # @current_user = @current_user || User.find_by(id: session[:user_id])
    end
  end

  #ユーザーがログインしているかどうかを判別する機能があります
  def logged_in?
    !current_user.nil?
    # current_user.nil?
    # 入っていると　= false
    # 入ってないと  = true
    # !current_user.nil?
    # 入っていると　= true
    # 入ってないと  = false
  end

  #ログアウト＝delete
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  #現在のlogin_inユーザーを返し、
  #Returns trueは、指定されたユーザーが現在のユーザーである場合
  def current_user?(user)
    user == current_user
  end
  #ログインしていないユーザーがマイクロポストを作らないようにするため
  def only_loggedin_users
    redirect_to login_url unless logged_in?
  end
end
