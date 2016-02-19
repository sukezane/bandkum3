class Users::RegistrationsController < Devise::RegistrationsController
 #Twitter auth
  # def build_resource(hash=nil)
  #   hash[:uid] = User.create_unique_string
  #   super
  # end

  
 def sign_up_params
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name,:email,:password,:password_confirmation,:part_1,:user_id,:Birth_date,:gender,:start_at_part_1,:start_at_part_2,:current_place,:start_at_band) }
     super
end
end