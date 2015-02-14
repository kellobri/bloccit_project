require 'faker'

#50.times do 
#	Post.create!(
#		title: Faker::Lorem.sentence,
#		body: Faker::Lorem.paragraph
#		)
#end
#posts = Post.all

#100.times do 
#	Comment.create!(
#		post: posts.sample,
#		body: Faker::Lorem.paragraph
#		)
#end

Post.create!(
	title: "You Won't Believe the Three Salad Dressings I got from Whole Foods Today",
	body: "1. Ranch Chia  2. Apple Fennel  3. Balsamic Thyme"
	)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"