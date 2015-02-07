class PagesController < ApplicationController

  def home
  end

  def about
  end

  def landing
  	@disable_navbar = true
  	@random_pin = Pin.where.not(id: @pin).order("RANDOM()").first
  end 
end
