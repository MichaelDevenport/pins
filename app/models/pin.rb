class Pin < ActiveRecord::Base
	acts_as_votable
	searchkick
	belongs_to :user
	scope :subscribed, ->(followed_users) { where user_id: followed_users }
	belongs_to :category
	has_many :reviews

	has_attached_file :image, :styles => { :large => "400x400>", :medium => "300x300>", :thumb => "100x100>" }
	#validates :category, presence: true
    validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png image/gif)
	validates :image, presence: true
	validates :title, presence: true
	validates :description, presence: true
	validates_length_of :yt_uid, :minimum => 11, :maximum => 11, :allow_blank => true
end
