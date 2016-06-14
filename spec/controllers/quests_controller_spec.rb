require 'spec_helper'

describe QuestsController do

	#Missing #edit #all #show

	before :each do
		@quest = create(:quest)
	end
	describe "GET #all" do
		it "returns all quests json" do
			quest_all = Quest.all
			quest_json = quest_all.map{|quest| QuestSerializer.new(quest)}.to_json
			get :all, :format => 'json'
			expect(response.body).to match(quest_json)
		end
	end

	describe 'GET #show' do
		it "assigns the requested quest to @quest" do
			get 'show', :id => @quest
			expect(assigns(:quest)).to eq @quest
		end
	end

	describe 'GET #new' do
		it "assigns a new Quest to @Quest" do
			get :new
			expect(assigns(:quest)).to be_a_new(Quest)
		end
	end

	describe 'POST #create' do
		context "with valids attributes" do
			it "saves the new quest in the database" do
				expect{
					post 'create', quest: attributes_for(:quest)
				}.to change(Quest, :count).by(1)
			end
		end
		context "with invalids attibutes" do
			it "does not save the quest in the database" do
				expect{
					post 'create', quest: attributes_for(:quest, name: nil)
				}.to_not change(Quest, :count)
			end
		end
	end

	describe 'DELETE #delete' do
		it "delete a quest with a given id" do
			quest_example = create(:quest)
			expect{
				delete 'delete', :id => quest_example.id
			}.to change(Quest, :count).by(-1)
		end
	end

	describe 'PATCH #update' do
		it "changes a quest attribute" do
			quest = create(:quest)
			old_name = quest.name
			patch 'update', id: quest, quest: attributes_for(:quest, name: "A different name")
			new_name = quest.name
			expect(new_name!=old_name)
		end
	end
end
