class SubadminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  private

  # Require an administrator role for being in this portal
  def require_admin
    unless current_user.subadmin?
      flash[:error] = "Not authorized for this portal!"
      redirect_to appropriate_redirect_url
    end
  end
end
