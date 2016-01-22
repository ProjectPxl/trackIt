user = User.new(
  :username => 'paulm', :email => 'maltsevp@gmail.com', :password => '12345678', :password_confirmation => '12345678'
)
user.save!