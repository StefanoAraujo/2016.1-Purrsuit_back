require 'spec_helper'

describe DeputiesController do

  before :each do
    @uf = create(:uf)
    @party = create(:party)
    @deputy = create(:deputy)
    @user = create(:user)
  end

  describe "GET #all" do
    it "returns all deputies json" do
      deputy_all = Deputy.order(:deputy_name)
      deputy_json = deputy_all.map{|deputy| DeputySerializer.new(deputy)}.to_json
      get :all
      expect(response.body).to match(deputy_json)
    end
  end

  describe 'GET #new' do
    it "assigns a new Deputy to @deputy" do
      get :new
      expect(assigns(:deputy)).to be_a_new(Deputy)
    end
  end

  describe 'GET #show' do
    it "assigns the requested deputy to @deputy" do
      get 'show', :id => @deputy.id
      expect(assigns(:deputy)).to eq @deputy
    end
    it "returns json deputy" do
      deputy_json = DeputySerializer.new(@deputy).to_json
      get 'show', :id => @deputy.id
      expect(response.body).to have_content deputy_json
    end
  end

  describe 'POST #create' do
    context "With valid attributes" do
      it "saves the new deputy in the database" do
        expect {
          post 'create', deputy: attributes_for(:deputy)
        }.to change(Deputy, :count).by(1)
      end
    end
    context "With invalid attributes" do
      it "does not save the deputy in the database" do
        expect{
          post 'create', deputy: attributes_for(:deputy, deputy_name: nil)
        }.to_not change(Deputy, :count)
      end
    end
  end

  describe 'DELETE #delete' do
    it "delete an user with a given id" do
      deputy_example = create(:deputy)
      expect{
        delete 'delete', :id => deputy_example.id
      }.to change(Deputy, :count).by(-1)
    end
  end

  describe 'PATCH #update' do
    context "valid attributes" do
      it "changes @deputy's atrributes" do
        patch 'update', id:@deputy, deputy: attributes_for(:deputy, name: "Mudando")
        @deputy.reload
        expect(@deputy.name).to eq("Mudando")
      end
    end
    context "invalid attributes" do
      it "does not change @deputy attributes" do
        @deputy = create(:deputy, name: "Nome")
        patch 'update', id:@deputy, deputy: attributes_for(:deputy, name: nil)
        @deputy.reload
        expect(@deputy.name).to eq("Nome")
      end
    end
  end

  describe 'GET #followed_deputies' do
    it  "shows followed deputies from a user" do
      @user.follow(@deputy)
      followed_deputies = @user.following
      followed_json = followed_deputies.map{|deputy| DeputySerializer.new(deputy)}.to_json
      get :followed_deputies, id:@user.id
      expect(response.body).to match(followed_json)
    end
  end

  describe 'GET #search' do
      before :each do
        create(:deputy)
        get :search, toSearch:@deputy.deputy_name
        @deputy_json = response.body
      end
    it  "returns the correct deputy" do
      get :search, toSearch:@deputy.deputy_name
      expect(response.body).to match(@deputy_json)
    end

  end

end
