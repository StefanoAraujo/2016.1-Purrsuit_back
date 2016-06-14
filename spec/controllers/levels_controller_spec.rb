require 'spec_helper'

describe LevelsController do
  before :each do
    @level = create(:level)
  end

  describe "GET #all" do
		it "returns all levels json" do
			level_all = Level.all
			level_json = level_all.map{|level| LevelSerializer.new(level)}.to_json
			get :all
			expect(response.body).to match(level_json)
		end
	end

end
