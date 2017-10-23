class Score < ApplicationRecord
  belongs_to :masterscore

  # accepts_nested_attributes_forを使うためpresence: trueは使用しない  
  # validates :hole_no, presence: true 
  # validates :hole_score, presence: true 
  # validates :masterscore_id, presence: true 
end
