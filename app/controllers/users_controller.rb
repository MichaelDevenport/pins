class UsersController < ActionController::Base

	layout "application"

  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @users = User.all
  end


  def pins
    @user = User.find(params[:id])
    @pins = @user.pins.order("created_at DESC").paginate(:page => params[:page], :per_page => 50)
  end

end