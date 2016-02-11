class UsersController < ApplicationController
	skip_before_action :ensure_current_user

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Thanks #{@user.username}! Your account has been created!"
			log_in(@user)
			redirect_to questions_path
		else
			render :new
		end
	end

	def show
		@user = User.find_by(id: params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:username, :password )
	end
end