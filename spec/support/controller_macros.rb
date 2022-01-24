module ControllerMacros
  def login_user
    @user = create(:user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in @user
  end

  def login_admin
    @admin = create(:admin)
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in @admin
  end
end
