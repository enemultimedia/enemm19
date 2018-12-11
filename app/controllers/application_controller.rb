class ApplicationController < ActionController::Base
  def authenticate_admin_user!
    if current_user.nil?
      redirect_to new_user_session_path
    elsif !current_user.confirmed?
      sign_out
      redirect_to new_user_session_path
    end
  end
end
