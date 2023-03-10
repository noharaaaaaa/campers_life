class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :last_name, :first_name, :profile )
  end

  def set_user
    @user = User.find(params[:id])
  end

end
