require "rails_helper"

describe "User views starred repos", type: :feature do
  
  before do
    stub_omniauth
    login_user
    new_user = create_user
    @user = GithubService.new(new_user)
  end


  it 'can view starred repos' do
    VCR.use_cassette("starred_repos") do
      stars = @user.starred_repos
      expect(stars.first[:name]).to eq("salary")
      expect(stars.count).to eq(4)
    end
  end
end