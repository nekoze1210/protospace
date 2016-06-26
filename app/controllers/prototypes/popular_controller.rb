class Prototypes::PopularController < ApplicationController

  def index
    @protos = Prototype.eager_load(:user).order("likes_count DESC").page(params[:page]).per(12)
  end

end
