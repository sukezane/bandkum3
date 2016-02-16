class UsersController < ApplicationController

def index
  
end

  def show
    @user = User.find(params[:id])
    # @users = User.all
    @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
  end

end
