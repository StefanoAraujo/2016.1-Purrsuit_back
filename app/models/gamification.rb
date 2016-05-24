class Gamification < ActiveRecord::Base
	actable
	validates_numericality_of :experience_points

	validates :name, presence: true, length: {maximum: 50}, uniqueness: true
	validates :description, presence: true, length: {maximum: 140}, uniqueness: true
	validates :experience_points, presence: true

end
