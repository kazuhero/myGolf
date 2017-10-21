class Masterscore < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :score
end
