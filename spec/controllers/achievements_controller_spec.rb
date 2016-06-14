require 'spec_helper'

describe AchievementsController do

	before :each do
		@achievement = create(:achievement)
	end

	describe "GET #all" do
		it "returns all achievements json" do
			achv_all = Achievement.all
			achv_json = achv_all.map{|achv| AchievementSerializer.new(achv)}.to_json
			get :all, :format => 'json'
			expect(response.body).to match(achv_json)
		end
	end

	describe 'GET #show' do
		it "assigns the requested achievement to @achievement" do
			get 'show', :id => @achievement
			expect(assigns(:achievement)).to eq @achievement
		end
		it "does not find the requested achievement" do
			get 'delete', :id => @achievement
			expect{
				get 'show', :id => @achievement
			}.to raise_error(RuntimeError, "ERROR")
		end
	end

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
	end

	describe 'DELETE #delete' do
		it "delete an achievement with a given id" do
			achievement_example = create(:achievement)
			expect{
				delete 'delete', :id => achievement_example.id
			}.to change(Achievement, :count).by(-1)
		end
	end
	
	describe 'GET #edit' do
		it "should return sucess" do
			post :edit, id: @achievement
			expect(response).to have_http_status(200)
		end
	end

	describe 'PATCH #update' do
		it "changes an achievement attibute" do
			old_name = @achievement.name
			patch 'update', id: @achievement, achievement: attributes_for(:achievement, name: "A different name")
			new_name = @achievement.name
			expect(new_name!=old_name)
		end
		it "has an invalid attribute value" do
			expect(
				patch 'update', id: @achievement, achievement: attributes_for(:achievement, name: nil)).to render_template(:edit)
		end
	end
end
