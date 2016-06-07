class PrototypesController < ApplicationController

  def index
  end

  def show
  end

  def new
    @proto = Prototype.new
    @proto.images.build
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
    def proto_params
      params.require(:prototype).permit(
        :title,
        :catch_copy,
        :concept,
        images_attributes:[:thumbnail, :user_id]).merge(user_id: current_user.id)
    end
end
