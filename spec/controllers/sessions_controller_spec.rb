require 'spec_helper'

describe SessionsController do

  before :each do
    @user = create(:user, role_admin:true)
  end

  describe "POST #create" do
    it "redirects to achievements_all after login"
    
  end

  describe "GET #delete" do
    it "delete user session"do
      get :destroy, user_id: @user.id
      expect(response).to redirect_to('/login')
    end
  end

end
