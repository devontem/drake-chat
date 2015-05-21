class User < ActiveRecord::Base
  #connects to the comment model
  has_many :comments, dependent: :delete_all
    
  #defines an internal function for User Class (i.e. User.from_omniauth)
  class << self
    def from_omniauth(auth)
      provider = auth.provider #selects provider from authentication hash (i.e. facebook or twitter)
      uid = auth.uid 
      info = auth.info.symbolize_keys!
      user = User.find_or_initialize_by(uid: uid, provider: provider) #finds users in db w/ credentials, if not creates one
      user.name = info.name #updates or sets name
      user.avatar_url = info.image #updates or sets images
      user.profile_url = info.urls.send(provider.capitalize.to_sym)
      user.save! #saves the user to db
      user #returns the user
    end
  end
end