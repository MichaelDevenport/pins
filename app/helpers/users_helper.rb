module UsersHelper
	def avatar_url(user, options = { size: 50 })
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    size = options[:size]
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end 
end