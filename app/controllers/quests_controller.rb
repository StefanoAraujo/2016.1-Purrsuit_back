class QuestsController < ApplicationController

	def all
		@quest = Quest.all

		respond_to do |format|
			format.html
			format.json {render json: @quest}
		end
	end

	def show
		render json: Quest.find(params[:id])
	end

	def new
		@quest = Quest.new
	end

	def create
		@quest = Quest.new(quest_params)
		if @quest.save
			redirect_to :quests_all
		else
			render 'new'
		end
	end

	def edit

		@quest = Quest.find(params[:id])
		render 'edit'

	end

	def update
		@quest = Quest.find(params[:id])

		if @quest.update(quest_params)
			redirect_to :quests_all
		else
			render 'edit'
		end
	end

	def delete
		id_quest = params[:id]
		quests = Quest.where(id: id_quest)
		quest = quests.first
		quest.destroy
		redirect_to :quests_all
	end


	private

	def quest_params
		params.require(:quest).permit(:name, :experience_points, :description)
	end
end
