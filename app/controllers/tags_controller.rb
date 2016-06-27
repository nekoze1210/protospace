class TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag.most_used
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @protos = Prototype.tagged_with(@tag).order('created_at DESC').page(params[:page]).per(12)
  end

end
