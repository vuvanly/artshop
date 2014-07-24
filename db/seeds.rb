# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.roles.each do |role|
  Role.find_or_create_by({name: role})
end

admins = [
  {
    email: 'vanly.se05@gmail.com',
    username: 'vanly.se05'
  }
]

admins.each do |a|
  admin = Admin.find_by_email a[:email]
  if admin
  else
    Admin.new({email: a[:email], username: a[:username], password: '1qazxsw2'})
  end
end

