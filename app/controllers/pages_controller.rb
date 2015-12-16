class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:scrape]
	before_filter :disable_nav, only: [:landing]

  def home
  end

  def about
  end

  def contact
  end


  def landing
  	@disable_navbar = true
  	@random_pin = Pin.where.not(id: @pin).order("RANDOM()").first
  end

  def feed
  end 

  def your_pins
  end

  def scrape
  end
end
