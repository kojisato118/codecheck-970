class ApplicationController < ActionController::Base
  private
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end

  def current_user
    devise_current_user
  end
end
