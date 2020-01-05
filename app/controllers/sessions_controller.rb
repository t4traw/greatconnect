class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: sessions_params[:email])
    if user && user.authenticate(sessions_params[:password])
      log_in user
      redirect_to root_path, success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end  
  end
  
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(user_id)
    @current_user = nil
  end
  
  private
  def sessions_params
    params.require(:session).permit(:email, :password)
  end  
end
