class Masterscore < ApplicationRecord
  belongs_to :user
  belongs_to :course
  
  validates :user_id, presence: true
  validates :course_id, presence: true
  
  has_many :scores

end
