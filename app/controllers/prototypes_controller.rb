class PrototypesController < ApplicationController
  before_action :set_proto, only: [:show, :edit, :destroy]

  def index
    @protos = Prototype.includes(:user).order('created_at DESC').page(params[:page]).per(12)
  end

  def show
    @user = @proto.user
    @images = @proto.protoimages
  end

  def new
    @proto = Prototype.new
    @proto.protoimages.build
  end

  def create
    @proto = Prototype.new(proto_params)
    if @proto.save
      redirect_to root_path, notice: 'done'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def set_proto
      @proto = Prototype.find(params[:id])
    end

    def proto_params
      params.require(:prototype).permit(
        :title,
        :catch_copy,
        :concept,
        protoimages_attributes:[:thumbnail, :role]).merge(user_id: current_user.id)
    end
end
