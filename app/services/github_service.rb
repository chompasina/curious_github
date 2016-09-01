class GithubService
  attr_accessor :current_user
  
  def initialize(current_user)
    @current_user = current_user
    @_conn = Faraday.new("https://api.github.com/") do |faraday|
      faraday.adapter   Faraday.default_adapter
      faraday.params['access_token'] = current_user.token
    end
  end
    
  def starred_repos
    parse(conn.get("users/#{@current_user.nickname}/starred"))
  end
  
  def followers
    parse(conn.get("users/#{@current_user.nickname}/followers"))
  end
  
  def followings
    parse(conn.get("users/#{@current_user.nickname}/following"))
  end
  
  def recent_commits
    
  end
  
  def user_info
    parse(conn.get("user")) #("users/#{current_user.nickname}")
  end
  
  
private

    def conn
      @_conn
    end
    
    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end

# GithubService.new(current_user).user_name