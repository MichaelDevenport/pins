class PagesController < ApplicationController

  def home
  end

  def about
  end

  def landing
  	@disable_navbar = true
  end 
end
