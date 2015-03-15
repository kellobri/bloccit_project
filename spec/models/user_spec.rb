require 'rails_helper'

describe User do

	before do 
		@user1, @post1, @comment1 = create(:user_with_post_and_comment)

		@user2, @post2, @comment2 = create(:user_with_post_and_comment)
		2.times { create(:comment, user: @user2, post: @post2) }
	end

	describe "#favorited(post)" do

		xit "returns `nil` if the user has not favorited the post" do
			
		end

		xit "returns the appropriate favorite if it exists" do
		end
	end

	describe ".top_rated" do

		it "returns users ordered by comments + posts" do
			expect( User.top_rated ).to eq([@user2, @user1])
		end

		it "stores a `posts_count` on user" do
			users = User.top_rated
			expect( users.first.posts_count ).to eq(1)
		end

		it "stores a `comments_count` on user" do
			users = User.top_rated
			expect( users.first.comments_count ).to eq(3)
		end
	end
end