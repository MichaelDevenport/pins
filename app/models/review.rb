class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :pin
	validates :rating, presence: true
end
