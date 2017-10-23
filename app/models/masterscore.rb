class Masterscore < ApplicationRecord
  belongs_to :user
  
  validates :total_score, presence: true
  validates :date, presence: true
  validates :course_code, presence: true
  
  has_many :scores
  accepts_nested_attributes_for :scores


end
