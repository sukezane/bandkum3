class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
def index
     # @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
      # @conversations = Conversation.involving(current_user).order("created_at DESC")
      @q = User.ransack(params[:q])
     @users = @q.result(distinct: true)
  end

protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:name, :part_1,:user_id,:Birth_date,:gender,:start_at_part_1,:start_at_part_2,:current_place,:start_at_band]
      devise_parameter_sanitizer.for(:sign_in) <<[:name, :part_1,:user_id,:Birth_date,:gender,:start_at_part_1,:start_at_part_2,:current_place,:start_at_band]
      devise_parameter_sanitizer.for(:account_update) << [:name, :part_1,:user_id,:Birth_date,:gender,:start_at_part_1,:start_at_part_2,:current_place,:start_at_band]
    end
  
end
