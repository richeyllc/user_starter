class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Where to redirect to when a Devise resource logs in
 def after_sign_in_path_for(resource)
   if resource.is_a?(User)
     if resource.admin?
       request.env['omniauth.origin'] || stored_location_for(resource) || admin_root_path
     elsif resource.subadmin?
       request.env['omniauth.origin'] || stored_location_for(resource) || subadmin_root_path
     elsif resource.manager?
       request.env['omniauth.origin'] || stored_location_for(resource) || manager_root_path
     elsif resource.user?
       request.env['omniauth.origin'] || stored_location_for(resource) || user_root_path
     elsif resource.guest?
       request.env['omniauth.origin'] || stored_location_for(resource) || guest_root_path
     end
   elsif resource.is_a?(Customer)
     request.env['omniauth.origin'] || stored_location_for(resource) || customer_dashboard_path
   end
 end

 # Where should we redirect if we're not authorized to be in the portal we're in
  def appropriate_redirect_url
    if current_user.present?
      if current_user.admin?
        user_root_path
      elsif current_user.subadmin?
        subadmin_root_path
      elsif current_user.manager?
        manager_root_path
      elsif current_user.user?
        user_root_path
      elsif current_user.guest?
        guest_root_path
      end
    elsif current_customer.present?
      customer_root_path
    end
  end
  helper_method :appropriate_redirect_url
end
