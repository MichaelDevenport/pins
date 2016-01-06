class FeedController < ApplicationController
  before_action :authenticate_user!

  def index
  	@pins = Pin.subscribed current_user.followed_users
  end
end