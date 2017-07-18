# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..10).each do |i|
  name = Faker::Job.unique.field
  department = Department.new(name: name)
  if department.save
    puts "department #{i} created"
  else
    puts department.errors.messages
  end
end

(1..250).each do |i|
  first_name    = Faker::Name.first_name
  username      = "user#{i}"
  last_name     = Faker::Name.last_name
  email         = Faker::Internet.free_email("#{first_name} #{last_name}")
  department_id = (i%10 + 1)
  position      = Faker::Name.title
  user = User.new(
    username: username,
    first_name: first_name,
    last_name: last_name, 
    email: email, 
    department_id: department_id,
    position: position,
    password: "password")
  if user.save
    puts "user #{i} created!"
  else
    puts user.errors.messages
  end
end

(1..250).each do |i|
  content = Faker::Lorem.paragraph(1,true,3)
  user_id = (251-i)
  post = Post.new(content: content, user_id: user_id)
  if post.save
    puts "post #{i} created!"
  else
    puts post.errors.messages
  end
end