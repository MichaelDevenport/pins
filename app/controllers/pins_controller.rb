class PinsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def search
    if params[:search_pin].present?
      @pins = Pin.search(params[:search_pin])
    else
      @pins = Pin.all
    end
  end

  def index
    if params[:catergory].blank?
      @pins = Pin.all.order("created_at DESC").paginate(page: params[:page], per_page: 20)
    else
      @catergory_id = Catergory.find_by(name: params[:catergory]).id
      @pins = Pin.where(catergory_id: @catergory_id).order("created_at DESC").paginate(page: params[:page], per_page: 20)
    end 
  end

  def show
    @pin.increment_view_count
    @random_pin = Pin.where.not(id: @pin).order("RANDOM()").first
    @reviews = Review.where(pin_id: @pin.id).order("created_at DESC").limit(5)
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  def new
    @pin = current_user.pins.new
  end

  def edit
  end

  def create
    @pin = current_user.pins.new(pin_params)
    @pin.user_name = current_user.name()
    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.'
    else
      render action: 'new'
    end
  end


  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  def upvote
    @pin.upvote_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render 'vote' }
    end
  end

  def downvote
    @pin.downvote_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js  { render 'vote' }
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def find_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end

    def pin_params
      params.require(:pin).permit(:link, :description, :title, :image, :category_id, :yt_uid, :name, :tag_list) 
    end

    def category_params
      params.require(:category).permit(:name)
    end
end



