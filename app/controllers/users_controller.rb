class UsersController < ApplicationController
before_action :authenticate_user!, except: :show
before_action :set_user, only: [:show, :edit, :update]

  def show
    @protos = @user.prototypes.includes(:user).order('created_at DESC').page(params[:page]).per(12)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to @user, notice: "ユーザー情報が更新されました。"
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :thumbnail, :profile, :member, :work, :avatar)
  end
end
