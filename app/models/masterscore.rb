class Masterscore < ApplicationRecord
  before_save do 
    score = self.scores
    total_score = 0
    score.each do |s|
      total_score += s.hole_score
      self.total_score = total_score
    end
  end
  
  belongs_to :user
  
  validates :total_score, presence: true
  validates :date, presence: true
  validates :course_code, presence: true
  validates :course_name, presence: true
  
  has_many :scores, inverse_of: :masterscore, dependent: :destroy
  accepts_nested_attributes_for :scores, allow_destroy: true
  

end
