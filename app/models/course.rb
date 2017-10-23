class Course < ApplicationRecord
	validates :course_code, presence: true, length: { maximum: 255 } 
  validates :name, presence: true, length: { maximum: 255 } 
  validates :address, presence: true, length: { maximum: 255 } 
  validates :description, presence: true, length: { maximum: 255 } 
  validates :url, presence: true, length: { maximum: 255 } 
  validates :image_url, presence: true, length: { maximum: 255 } 
  validates :latitude, presence: true
  validates :longitude, presence: true
  
  has_many :scores
  has_many :masterscores
  has_many :course_scores, through: :masterscores, source: :score
  
end
