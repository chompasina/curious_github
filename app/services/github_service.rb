class GithubService
  attr_reader :current_user, :user_hash
  
  def initialize(current_user)
    @_conn = Faraday.new("https://api.github.com/") do |faraday|
      faraday.adapter   Faraday.default_adapter
      # faraday.params['client_id'] = ENV['GITHUB_KEY']
      # faraday.params['client_key'] = ENV['GITHUB_SECRET']
       faraday.params['access_token'] = current_user.token
    end
    @current_user = current_user
  end
    
  def user_info
    response = conn.get("user") #("users/#{current_user.nickname}")
    @user_hash = JSON.parse(response.body, symbolize_names: true)
  end
  
private

    def conn
      @_conn
    end
end