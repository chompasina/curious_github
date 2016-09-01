require 'rails_helper'

RSpec.describe GithubService, vcr: true do
  
  before do
    stub_omniauth
  end
  
  context "#user_info" do 
    it "filters on parameters" do
      current_user = create_user
      @user = GithubService.new(current_user)
      user_hash = @user.user_info
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