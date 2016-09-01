class Profile 
  attr_reader :name
  
  def initialize(params)
    # require "pry"; binding.pry
    @name = params[:name]
  end
    
  # def name
  #   "#{@name}"
  # end
  
  def self.all_info(params)
    GithubService.new(current_user).user_info.map do |raw_user_data|
      require "pry"; binding.pry
      Profile.new(raw_user_data)
    end
  end
end
  # 
  # def self.service(user)
  #   @@service ||= GithubService.new(current_user)
  # end
  # 
  # def self.name
  #   service(user)
  #   byebug
  #   user_hash
  # end
  
# end

