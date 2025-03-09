require 'rails_helper'

RSpec.describe "UserRewards", type: :request do
  describe "GET /user_rewards" do
    it "works! (now write some real specs)" do
      get user_rewards_index_path
      expect(response).to have_http_status(200)
    end
  end
end
