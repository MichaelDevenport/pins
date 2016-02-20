class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index]
  

  def index
    @users = User.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @pins = current_user.pins.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end

  def pins
    @pins = @user.pins.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end

  def following
    @title = "Following"
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def set_user
      @user = User.find_by(name: params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password)                                
    end
end
  