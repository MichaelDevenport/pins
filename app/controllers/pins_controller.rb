class PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def search
    if params[:search].present?
      @pins = Pin.search(params[:search])
    else
      @pins = Pin.all
    end
  end

  def index
    if params[:catergory].blank?
      @pins = Pin.all.order("created_at DESC").paginate(page: params[:page], per_page: 50)
    else
      @catergory_id = Catergory.find_by(name: params[:catergory]).id
      @pins = Pin.where(catergory_id: @catergory_id).order("created_at DESC").paginate(page: params[:page], per_page: 20)
    end 
  end

  def show
    @random_pin = Pin.where.not(id: @pin).order("RANDOM()").first
    @reviews = Review.where(pin_id: @pin.id).order("created_at DESC").limit(10)
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)
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
    redirect_to :back
  end

  def downvote
    @pin.downvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def catergory_params
      params.require(:catergory).permit(:name)
    end 

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:link, :description, :title, :image, :catergory_id, :yt_uid) 
    end

    def find_pin
      @pin = Pin.find(params[:id])
    end
end