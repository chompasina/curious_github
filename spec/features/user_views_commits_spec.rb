# require "rails_helper"
# 
# describe "User views their commits", type: :feature do
#   
  # before do
  #   stub_omniauth
  #   login_user
  #   new_user = create_user
  #   @user = GithubService.new(new_user)
  # end
# 
# 
#   it 'can view their commits' do
#    x VCR.use_cassette("commits") do
#       require "pry"; binding.pry
#       user_commits = @user.commit_messages(user)
#       # expect(stars.first[:name]).to eq("salary")
#       # expect(stars.count).to eq(4)
#     end
#   end
# end