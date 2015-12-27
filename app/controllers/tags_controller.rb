class TagsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @tags = Tag.all.order("created_at DESC")
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    Tag.find(params[:id]).destroy
    redirect_to tag_path
  end
end