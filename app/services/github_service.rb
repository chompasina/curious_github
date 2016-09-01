class GithubService
  attr_reader :current_user
  
  def initialize(current_user)
    @current_user = current_user
    @_conn = Faraday.new("https://api.github.com/") do |faraday|
      faraday.adapter   Faraday.default_adapter
      # faraday.params['access_token'] = current_user.token
    end
    @_conn.headers["Authorization"] = "token #{current_user.token}"
  end
    
  def starred_repos
    # require "pry"; binding.pry
    parse(conn.get("users/#{current_user.nickname}/starred"))
  end
  
  def followers
    parse(conn.get("users/#{current_user.nickname}/followers"))
  end
  
  def followings
    parse(conn.get("users/#{current_user.nickname}/following"))
  end
  
  def recent_activities
    parse(conn.get("users/#{current_user.nickname}/events/public"))
  end
  
  # def following_activities
  #   parse(conn.get("users/#{@current_user.followings}/events/public"))
  # end
  
  def push_events(user)
    push_events = parse(conn.get("users/#{user}/events")).select do |event|
      event[:type] == "PushEvent"
    end
    push_events
  end
  
  def commit_messages(user)
    commit_messages = push_events(user).map do |event|
      event[:payload][:commits][:message] if user == event[:actor][:login]
    end
    # require "pry"; binding.pry
  end
    
  
  def user_info
    parse(conn.get("users/#{current_user.nickname}")) #("user")
  end
  
  
private

    def conn
      @_conn
    end
    
    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end

# GithubService.new(current_user).commit_messages(user)