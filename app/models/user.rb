class User < ApplicationRecord
  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)
    user.token = auth.credentials.token
    user.nickname = auth.info.nickname
    user.email = auth.info.email
    user.image = auth.info.image
    user.name = auth.info.name
    user.save
    user  
  end
end
