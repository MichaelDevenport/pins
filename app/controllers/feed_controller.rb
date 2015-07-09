class FeedController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
  	@pins = Pin.subscribed current_user.followed_users
  end
end