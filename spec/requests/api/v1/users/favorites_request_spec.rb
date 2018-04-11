require 'rails_helper'

describe "As a registered user" do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApiBaseController).to receive(:current_user).and_return(@user)
  end
  describe "When I send a 'GET' request to '/api/v1/user/favorites?api_key=abc123'" do
    it "I should receive a JSON response" do
      @favorite = @user.favorites.create!(neo_reference_id: 2153306)
      get '/api/v1/user/favorites?api_key=abc123'

      expect(response).to be_success
      parsed_json = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_json[0][:id]).to eq(@favorite.id)
      expect(parsed_json[0][:neo_reference_id]).to eq(@favorite.neo_reference_id)
      expect(parsed_json[0][:user_id]).to eq(@user.id)
      expect(parsed_json[0][:asteroid][:name]).to eq("153306 (2001 JL1)")
      expect(parsed_json[0][:asteroid][:is_potentially_hazardous_asteroid]).to eq(false)
    end
  end

  describe "When I send a POST request to '/api/v1/user/favorites' with an 'api_key' of 'abc123' and a 'neo_reference_id' of '2021277'" do
    it "it should save the asteroid to my favorites" do
      post '/api/v1/user/favorites?api_key=abc123&neo_reference_id=2021277'

      expect(response).to be_success
      parsed_json = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_json[:id]).to eq(2)
      expect(parsed_json[:neo_reference_id]).to eq("2021277")
      expect(parsed_json[:user_id]).to eq(@user.id)
      expect(parsed_json[:asteroid][:name]).to eq("21277 (1996 TO5)")
      expect(parsed_json[:asteroid][:is_potentially_hazardous_asteroid]).to eq(false)
    end
  end
end
