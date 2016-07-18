class PrototypesController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_proto, except: [:index, :new, :create]

  def index
    @protos = Prototype.includes(:user).order("RAND()").page(params[:page]).per(13)
  end

  def show
    @user = @proto.user
    @images = @proto.protoimages
    @comments = @proto.comments.includes(:prototype)
    @comment = @proto.comments.new(prototype_id: @proto.id) if user_signed_in?
    @tags = @proto.tags
  end

  def new
    @proto = Prototype.new
    @proto.protoimages.build
  end

  def create
    @proto = Prototype.new(proto_params)
    if @proto.save
      redirect_to root_path, notice: 'Your prototype has created successfully.'
    else
      flash.now[:alert] = 'Error: Please Fill in all blanks !'
      render :new
    end
  end

  def edit
    @subs = @proto.protoimages.sub
  end

  def update
    if @proto.update(proto_params)
      redirect_to prototype_path(@proto), notice: 'Your prototype has updated successfully.'
    else
      flash.now[:alert] = 'Error: Please Fill in all blank form !'
      render :edit
    end
  end

  def destroy
    @proto.destroy
    redirect_to root_path, notice: 'Your prototype has just deleted.'
  end

  private
    def set_proto
      @proto = Prototype.find(params[:id])
    end

    def proto_params
      params.require(:prototype).permit( \
        :title,
        :catch_copy,
        :concept,
        protoimages_attributes:[
          :id
          :thumbnail,
          :role,
          :prototype_id,
          :_destroy]).merge(
          tag_list: params[:prototype][:tag])
    end
end
