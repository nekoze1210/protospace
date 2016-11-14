class Prototypes::LikesController < ApplicationController
  before_action :set_proto, only: [:create, :destroy]

  def create
    @proto.likes.create(like_params)
  end

  def destroy
    @proto.likes.find_by(prototype_id: params[:prototype_id], user_id: current_user).destroy
    @proto.reload
  end

  private
  def set_proto
    @proto = Prototype.find(params[:prototype_id])
  end

  def like_params
    params.permit(
      prototype_id: params[:prototype_id]).merge(user_id: current_user.id)
  end
end
