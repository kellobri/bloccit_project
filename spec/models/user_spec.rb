require 'rails_helper'

describe User do

	include TestFactories

	before do
		@post = associated_post
		@post_another = associated_post
		@user = authenticated_user
	end

	describe "#favorited(post)" do
		it "returns `nil` if the user has not favorited the post" do
			expect( @user.favorites.find_by_post_id(@post.id) ).to be_nil
		end

		it "returns the appropriate favorite if it exists" do
			@user.favorites.where(post: @post).create
			expect( @user.favorites.find_by_post_id(@post.id) ).not_to be_nil
		end

		it "returns `nil` if the user has favorited another post" do
			expect( @user.favorites.find_by_post_id(@post_another.id) ).to be_nil
		end
	end
end