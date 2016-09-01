require 'rails_helper'

describe Profile do
  it "works" do
    expect(Profile).to be_truthy
  end
  
  it "has attributes" do 
    raw_user_data = {:login=>"chompasina",
     :id=>15034459,
     :avatar_url=>"https://avatars.githubusercontent.com/u/15034459?v=3",
     :gravatar_id=>"",
     :url=>"https://api.github.com/users/chompasina",
     :html_url=>"https://github.com/chompasina",
     :followers_url=>"https://api.github.com/users/chompasina/followers",
     :following_url=>"https://api.github.com/users/chompasina/following{/other_user}",
     :gists_url=>"https://api.github.com/users/chompasina/gists{/gist_id}",
     :starred_url=>"https://api.github.com/users/chompasina/starred{/owner}{/repo}",
     :subscriptions_url=>"https://api.github.com/users/chompasina/subscriptions",
     :organizations_url=>"https://api.github.com/users/chompasina/orgs",
     :repos_url=>"https://api.github.com/users/chompasina/repos",
     :events_url=>"https://api.github.com/users/chompasina/events{/privacy}",
     :received_events_url=>"https://api.github.com/users/chompasina/received_events",
     :type=>"User",
     :site_admin=>false,
     :name=>"Tommasina",
     :company=>nil,
     :blog=>nil,
     :location=>"Washington, DC",
     :email=>nil,
     :hireable=>nil,
     :bio=>nil,
     :public_repos=>29,
     :public_gists=>7,
     :followers=>2,
     :following=>1,
     :created_at=>"2015-10-08T14:28:23Z",
     :updated_at=>"2016-08-19T21:43:01Z",
     :private_gists=>14,
     :total_private_repos=>0,
     :owned_private_repos=>0,
     :disk_usage=>735,
     :collaborators=>0,
     :plan=>{:name=>"free", :space=>976562499, :collaborators=>0, :private_repos=>0}
    }
    profile = Profile.new(raw_user_data)
    expect(profile.name).to eq("Tommasina")
  end
end