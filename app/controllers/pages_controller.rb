class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:scrape_m3, :scrape_m4, :scrape_m6]
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

  def scrape_m3
  end

  def scrape_m4
  end

  def scrape_m6
  end

  def sitemap
  end
end
