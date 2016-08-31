class User < ApplicationRecord
  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.extra.raw_info.id)
    user.provider = auth.provider
    user.uid = auth.extra.raw_info.id
    user.token = auth.credentials.token
    
    user.save
    user  
  end
end
