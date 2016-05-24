class GamificationController < ApplicationController
	def all
		@gamifications = Gamification.all
	end
	def show
		@gamification = Gamification.find(params[:id])
	end
end
