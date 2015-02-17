class PostPolicy < ApplicationPolicy

	def index?
		true
	end
	
	class Scope < Scope
		#attr_reader :user, :scope

		#def initialize(user, scope)
		#	@user = user
		#	@scope = scope
		#end

		def resolve 
			if user.admin?
				scope.all
			else
				scope.where(:user_id => true)
			end
		end
	end

#	def update?
#		user.admin? or not post.published?
#	end

end