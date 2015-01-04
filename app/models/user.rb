class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
      # user.oath_token = auth['info']
      user.oauth_token = auth['credentials']['token']
      user.oauth_secret = auth['credentials']['secret']
    end
  end



end
