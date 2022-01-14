require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  before do
    visit hobbyspot_path
    login_user
    visit hobbyspot_user_session_path
    binding.pry
    fill_in "hobbyspot_user[email]", with: "#{@user.email}"
    fill_in "hobbyspot_user[password]", with: "#{@user.password}"
    click_button "ログイン"
    visit edit_hobbyspot_user_registration_path
    binding.pry
    click_button "アカウント削除"
  end

  describe "ログインした状態で" do
    it "アカウントが削除できる" do
      expect { click_button "OK" }.to change(User, :count).by(-1)
    end
  end
end
