require 'faker'

# Create Users

5.times do
	user = User.new(
		name: Faker::Name.name,
		email: Faker::Internet.email,
		password: Faker::Lorem.characters(10)
		)
	user.skip_confirmation!
	user.save!
end
users = User.all

15.times do
	Topic.create!(
		name: Faker::Lorem.sentence,
		description: Faker::Lorem.paragraph
	)
end
topics = Topic.all

50.times do 
	Post.create!(
		user: users.sample,
		topic: topics.sample,
		title: Faker::Lorem.sentence,
		body: Faker::Lorem.paragraph
		)
end
posts = Post.all

100.times do 
	Comment.create!(
        #user: users.sample,
		post: posts.sample,
		body: Faker::Lorem.paragraph
		)
end

50.times do 
	Summary.create!(
		post: posts.sample,
		synopsis: Faker::Lorem.paragraph
		)
end
summaries = Summary.all

summaries.each do |summary|
	p summary.post_id
end
#Post.create!(
#	title: "You Won't Believe the Three Salad Dressings I got from Whole Foods Today",
#	body: "1. Ranch Chia  2. Apple Fennel  3. Balsamic Thyme"
#	)

admin = User.new(
	name: 'Admin User',
	email: 'admin@example.com',
	password: 'helloworld',
	role: 'admin'
	)
admin.skip_confirmation!
admin.save!

moderator = User.new(
	name: 'Moderator User',
	email: 'moderator@example.com',
	password: 'helloworld',
	role: 'moderator'
	)
moderator.skip_confirmation!
moderator.save!

member = User.new(
	name: 'Member User',
	email: 'member@example.com',
	password: 'helloworld'
	)

member.skip_confirmation!
member.save!
	

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Summary.count} summaries created"