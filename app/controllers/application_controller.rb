class ApplicationController < ActionController::Base
  def after_sign_up_path_for(resource)
    hobbyspot_users_edit_url
  end

  def after_sign_in_path_for(resource)
    hobbyspot_url
  end

  def after_sign_out_path_for(resource)
    hobbyspot_url
  end
end
