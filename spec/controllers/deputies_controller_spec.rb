require 'spec_helper'

describe DeputiesController do

=begin
  describe 'GET #followed_deputies' do
    it "Should be in JSON format" do
      user_example = create(:user)
      deputy_example = create (:deputy)
      user_example.follow(deputy_example)
      get 'followed_deputies', :id => user_example, format: :json
      hash = JSON.parse(user_example.following.to_json)
      hash.delete("created_at")
      hash.delete("updated_at")
      hash.delete("uf_id")
      hash.delete("pary_id")
      hash[:uf] = UfSerializer.new(object.uf).attributes
      hash[:party] = PartySerializer.new(object.party).attributes
      followed_deputies_json = hash.to_json
      expect(response.body).to have_content followed_deputies_json
    end
  end
=end

end
