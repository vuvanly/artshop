users = []
# Default password for all users
PASSWORD = "1qazxsw2"
User.transaction do 
  50.times do |t|
    user = User.new(
      username: "demo#{t}",
      name: "Demo#{t}",
      email: "demo.user#{t}@demo.com",
      password: PASSWORD,
      password_confirmation: PASSWORD,
    )
    user.skip_confirmation!
    user.save!
    users << user
  end
end