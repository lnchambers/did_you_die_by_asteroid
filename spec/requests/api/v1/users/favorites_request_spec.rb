require 'rails_helper'

describe "As a registered user" do
  describe "When I send a 'GET' request to '/api/v1/user/favorites?api_key=abc123'" do
    it "I should receive a JSON response" do
      user = create(:user)
      favorite = user.favorites.create!(neo_reference_id: 2153306)
      binding.pry
      allow_any_instance_of(ApiBaseController).to receive(:current_user).and_return(user)
      get '/api/v1/user/favorites?api_key=abc123'

      expect(response).to be_success
    end
  end
end
