require 'rails_helper'

describe "As a registered user" do
  describe "When I send a 'GET' request to '/api/v1/user/favorites?api_key=abc123'" do
    it "I should receive a JSON response" do
      user = create(:user)
      favorite = user.favorites.create!(neo_reference_id: 2153306)
      allow_any_instance_of(ApiBaseController).to receive(:current_user).and_return(user)
      get '/api/v1/user/favorites?api_key=abc123'

      expect(response).to be_success
      parsed_json = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_json[0][:id]).to eq(favorite.id)
      expect(parsed_json[0][:neo_reference_id]).to eq(favorite.neo_reference_id)
      expect(parsed_json[0][:user_id]).to eq(user.id)
      expect(parsed_json[0][:asteroid][:name]).to eq("153306 (2001 JL1)")
      expect(parsed_json[0][:asteroid][:is_potentially_hazardous_asteroid]).to eq(false)
    end
  end
end
