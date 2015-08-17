
class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @projects = @user.projects.all
    end
    def user_params
        params.require(:user).permit(:image)
    end
end