class UsersController < ApplicationController
  def show
    user = GithubService.new(current_user)
    @starred_repos = user.starred_repos
    @followers = user.followers
    @followings = user.followings
    @recent_commits = user.recent_commits
  end
end