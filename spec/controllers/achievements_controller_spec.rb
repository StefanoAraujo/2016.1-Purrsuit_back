require 'spec_helper'

describe AchievementsController do
	
	#Missing #edit #all #show
	
	describe 'GET #new' do
		it "assigns a new Achievement to @Achievement" do
			get :new
			expect(assigns(:achievement)).to be_a_new(Achievement)
		end
	end
	
	describe 'POST #create' do
		context "with valids attributes" do
			it "saves the new achievement in the database" do
				expect{
					post 'create', achievement: attributes_for(:achievement)
				}.to change(Achievement, :count).by(1)
			end
		end
=begin
		context "without valids attributes" do
			it "does not save the achievement in the database" do
				expect{
					post 'create', achievement: attributes_for(:achievement, name: nil)
				}.to_not change(Achievement, :count)
			end
		end
=end
	end
	
	describe 'DELETE #delete' do
		it "delete an achievement with a given id" do
			achievement_example = create(:achievement)
			expect{
				delete 'delete', :id => achievement_example.id
			}.to change(Achievement, :count).by(-1)
		end
	end
	
	describe 'PATCH #update' do
		it "changes an achievement attibute" do
			achievement = create(:achievement)
			old_name = achievement.name
			patch 'update', id: achievement, achievement: attributes_for(:achievement, name: "A different name")
			new_name = achievement.name
			expect(new_name!=old_name)
		end
	end
end
