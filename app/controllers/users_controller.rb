class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]
  def show
  end

  def edit
  end

  def update
    flash[:success] = "ユーザー情報が更新されました。"
    @user.update(user_params)
    render :show
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :thumbnail, :profile, :member, :work)
  end
end
