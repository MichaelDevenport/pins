class PagesController < ApplicationController
	before_filter :disable_nav, only: [:landing]

  def home
  end

  def about
  end

  def contact
  end

  def scrape_yt
  end

  def landing
  	@disable_navbar = true
  	@random_pin = Pin.where.not(id: @pin).order("RANDOM()").first
  end

  def sitemap
  end
end
