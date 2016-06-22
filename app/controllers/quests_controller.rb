class QuestsController < ApplicationController

	def all
		@quest = Quest.all

		respond_to do |format|
			format.html
			format.json {render json: @quest}
		end
	end

	def show
		quest_id = params[:id]
		selected_quests = Quest.where(id: quest_id)
		@quest = nil
		if selected_quests.length > 0
			@quest = selected_quests.first
		else
			raise "ERROR"
		end
		render json: @quest
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

#:nocov:
	def received_quests
		user_id = params[:userId]
		user = User.find_by(id: user_id)
		received_quests = user.challengers
		if user.challengers
			render json: received_quests
		else
			raise "ERROR"
		end
	end
#:nocov:

	private

	def quest_params
		params.require(:quest).permit(:name, :experience_points, :description)
	end
end
