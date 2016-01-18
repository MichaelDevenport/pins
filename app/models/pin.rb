class Pin < ActiveRecord::Base
	acts_as_votable
	searchkick
	belongs_to :user
	scope :subscribed, ->(followed_users) { where user_id: followed_users }
	belongs_to :category
	belongs_to :adult
	has_many :reviews
	has_many :taggings
	has_many :tags, through: :taggings
	has_attached_file :image, :styles => { :large => "400x400>", :medium => "300x300>", :thumb => "100x100>" }
    validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png image/gif)
	validates :image, presence: true
	validates :title, presence: true
	validates :description, presence: true
	#==================regex to validiate format of Youtube url paths=============================
	validates :yt_uid, :format => {:with => /\A(?<protocol>https?:\/\/)?(?<sub-domain>www\.)?(?<domain-path>youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))(?<uid>(\w|-){11})\z/ , :message => "Invalid url!" }, :allow_blank => true

	def tag_list
		tags.join(', ')
	end

	def tag_list=(tags_string)
	    tag_names = tags_string.split(',').collect{ | tag | tag.strip.downcase}.uniq
	    self.tags = tag_names.collect{ | name | Tag.find_or_create_by(name: name)}
	end 

	def increment_view_count
		self.view_count ? self.view_count += 1 : self.view_count = 1
		self.save
	end

	after_create :trailer_or_full_video
	after_edit :trailer_or_full_video

	private

	def trailer_or_full_video
	   yt_url = "https://www.youtube.com/embed/"
	   yt_url << self.yt_uid.split("=").last.to_s
	   self.yt_uid = yt_url
	   save
	end 
end
