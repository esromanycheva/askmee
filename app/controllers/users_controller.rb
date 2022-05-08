class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :nickname, :email, :password)
    user = User.create(user_params)
    login(user)
    redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
  end

  private

  def login(user)
    session[:user_id] = user.id
  end
end
