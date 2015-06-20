class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
  end

  def dock
		@pins = current_user.pins.order("created_at DESC").paginate(:page => params[:page], :per_page => 50)
	end


  def pins
    @user = User.find(params[:id])
    @pins = @user.pins.order("created_at DESC").paginate(:page => params[:page], :per_page => 50)
  end

end