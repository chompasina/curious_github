class UsersController < ApplicationController
  def show
    user = GithubService.new(current_user)
    @starred_repos = user.starred_repos
    @followers = user.followers
    @followings = user.followings
    @recent_activities = user.recent_activities
  end
end