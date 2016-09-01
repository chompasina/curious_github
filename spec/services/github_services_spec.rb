require 'rails_helper'

describe GithubService do
  context "#user_info" do 
    it "filters on parameters" do
      VCR.use_cassette("github_service#user_info") do #needs to go inside of test definition
        current_user = User.create!(uid: "15034459", provider: "github",
        token: ENV['ACCESS_TOKEN'])
        user_hash = GithubService.new(current_user).user_info
        # require "pry"; binding.pry
        user_name = user_hash[:name]
        user_nickname = user_hash[:login]
        # byebug #to see what the hash is for the user_info spec test by running user_info
      
        expect(user_name).to eq("Tommasina")
        expect(user_nickname).to eq("chompasina")
        expect(user_hash.keys).to include(:login)
        expect(user_hash).to have_key(:id)
        expect(user_hash).to have_key(:avatar_url) #this is a better test to see if it has these keys, so less fragile
        expect(user_hash).to have_key(:followers_url) 
        expect(:name.in?(user_hash.keys)).to be_truthy
        expect(user_name.class).to eq(String) #if didn't want to hardcode in , this is good to check content type
      end
    end
  end
end