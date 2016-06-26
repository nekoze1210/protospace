class Prototypes::NewestController < ApplicationController

  def index
    @protos = Prototype.includes(:user).order('created_at DESC').page(params[:page]).per(12)
  end

end
