class Pin < ActiveRecord::Base
	searchkick
	belongs_to :user
	belongs_to :catergory
	has_many :reviews

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

    validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png)
	validates :image, presence: true
	validates :description, presence: true
end
