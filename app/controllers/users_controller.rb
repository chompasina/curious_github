class UsersController < ApplicationController
  def show
    user = GithubService.new(current_user)
    @starred_repos = user.starred_repos
  end
end