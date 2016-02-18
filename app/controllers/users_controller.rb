class UsersController < ApplicationController
	def index
		@user = current_user
		@representatives = @user.representatives
	end
end