require 'spec_helper'

describe PartiesController do

  before :each do
    @party = create(:party)
  end


  describe "GET #all" do
    it "returns all parties json" do
      party_all = Party.all
      party_json = party_all.map{|party| PartySerializer.new(party)}.to_json
      get :all
      expect(response.body).to match(party_json)
    end
  end

  describe 'GET #new' do
    it "assigns a new Party to @party" do
      get :new
      expect(assigns(:party)).to be_a_new(Party)
    end
  end

  describe 'GET #show' do
    it "assigns the requested Party to @party" do
      get 'show', :id => @party.id
      expect(assigns(:party)).to eq @party
    end
  end

  describe 'POST #edit'do
    it "should return sucess" do
      post :edit, id:@party
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    context "With valid attributes" do
      it "saves the new party in the database" do
        expect {
          post 'create', party: attributes_for(:party, name: "PARTIDO VALIDO", initials: "GG")
        }.to change(Party, :count).by(1)
      end
    end
    context "With invalid attributes" do
      it "does not save the party in the database" do
        expect{
          post 'create', party: attributes_for(:party, initials: nil)
        }.to_not change(Party, :count)
      end
    end
  end

  describe 'DELETE #delete' do
    it "delete a party with a given id" do
      party_example = create(:party, name:"PARTIDO DOS DELETES", initials:"PZ")
      expect{
        delete 'delete', :id => party_example.id
      }.to change(Party, :count).by(-1)
    end
  end

  describe 'PATCH #update' do
    context "valid attributes" do
      it "changes @parties atrributes" do
        patch 'update', id:@party, party: attributes_for(:party, name: "PARTIDO DA MUDANÇA", initials: "PMM")
        @party.reload
        expect(@party.name).to eq("PARTIDO DA MUDANÇA")
      end
    end
    context "invalid attributes" do
      it "does not change @party attributes" do
        @party = create(:party, name: "PARTIDO QUALQUER", initials: "PQQ")
        patch 'update', id:@party, party: attributes_for(:party, name: nil)
        @party.reload
        expect(@party.name).to eq("PARTIDO QUALQUER")
      end
    end
  end
end
