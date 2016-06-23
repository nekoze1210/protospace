class CommentsController < ApplicationController
  before_action :set_proto, only: :create

  def create
    @proto.comments.create(comment_params)
    @comments = @proto.comments
  end

  private
  def set_proto
    @proto = Prototype.find(params[:prototype_id])
  end

  def comment_params
    params.require(:comment).permit(:id, :text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
