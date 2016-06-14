require 'spec_helper'

describe UfsController do

  before :each do
    @uf = create(:uf)
  end


  describe "GET #all" do
    it "returns all ufs json" do
    uf_all = Uf.all
    uf_json = uf_all.map{|uf| UfSerializer.new(uf)}.to_json
    get :all
    expect(response.body).to match(uf_json)
    end
  end

  describe 'GET #new' do
    it "assigns a new Uf to @uf" do
      get :new
      expect(assigns(:uf)).to be_a_new(Uf)
    end
  end

  describe 'GET #show' do
    it "assigns the requested Uf to @uf" do
      get 'show', :id => @uf.id
      expect(assigns(:uf)).to eq @uf
    end
  end

  describe 'POST #create' do
    context "With valid attributes" do
      it "saves the new uf in the database" do
        expect {
          post 'create', uf: attributes_for(:uf, name: "Nome Válido", initials: "NV")
        }.to change(Uf, :count).by(1)
      end
    end
    context "With invalid attributes" do
      it "does not save the uf in the database" do
        expect{
          post 'create', uf: attributes_for(:uf, initials: nil)
        }.to_not change(Uf, :count)
      end
    end
  end

  describe 'DELETE #delete' do
    it "delete an user with a given id" do
      uf_example = create(:uf, name:"delete", initials:"DD")
      expect{
        delete 'delete', :id => uf_example.id
      }.to change(Uf, :count).by(-1)
    end
  end

  describe 'PATCH #update' do
    context "valid attributes" do
      it "changes @uf's atrributes" do
        patch 'update', id:@uf, uf: attributes_for(:uf, name: "Mudando", initials: "JJ")
        @uf.reload
        expect(@uf.name).to eq("Mudando")
      end
    end
    context "invalid attributes" do
      it "does not change @uf attributes" do
        @uf = create(:uf, name: "Nome", initials: "LL")
        patch 'update', id:@uf, uf: attributes_for(:uf, name: nil)
        @uf.reload
        expect(@uf.name).to eq("Nome")
      end
    end
  end
end
