class Score < ApplicationRecord
  validates :hole_no, presence: true 
  validates :hole_score, presence: true 
  validates :masterscore_id, presence: true 
end
