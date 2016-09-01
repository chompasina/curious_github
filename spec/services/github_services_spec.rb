require 'rails_helper'

describe GithubService do
  context "#user_info" do 
    it "filters on parameters" do
      VCR.use_cassette("github_service#user_info") do
        current_user = User.create!(uid: "15034459", provider: "github",
        token: ENV['ACCESS_TOKEN'])
        user_hash = GithubService.new(current_user).user_info
        user_name = user_hash[:name]
        user_nickname = user_hash[:login]
      
        expect(user_name).to eq("Tommasina")
        expect(user_nickname).to eq("chompasina")
        expect(user_hash.keys).to include(:login)
        expect(user_hash).to have_key(:id)
        expect(user_hash).to have_key(:avatar_url) 
        expect(user_hash).to have_key(:followers_url) 
        expect(:name.in?(user_hash.keys)).to be_truthy
        expect(user_name.class).to eq(String) 
      end
    end
  end
end