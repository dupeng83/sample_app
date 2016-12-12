class SessionsController < ApplicationController
  def new
  end

  def create
    user_info = user_params
    @user = User.find_by(email: user_info[:email])

    if @user && @user.authenticate( user_info[:password] )
      log_in(@user)

      flash[:notice] = "登录成功"
      redirect_to @user
    else
      flash.now[:alert] = "登录失败"
      render "new"
    end
  end

  def destroy
    log_out

    flash[:notice] = "退出成功"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:session).permit(:email, :password)
  end
end
