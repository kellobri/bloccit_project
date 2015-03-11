class FavoriteMailer < ApplicationMailer
	default from: "kellyobriant@gmail.com"

	def new_comment(user, post, comment)

		headers["Message-ID"] = "<comments/#{comment.id}@bloccit_project>"
		headers["In-Reply-To"] = "<post/#{post.id}@bloccit_project>"
		headers["References"] = "<post/#{post.id}@bloccit_project>"

		@user = user
		@post = post
		@comment = comment

		mail(to: user.email, subject: "New comment on #{post.title}")
	end
end
