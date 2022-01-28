require 'rails_helper'

RSpec.describe "AdminsRegistrationsController", js: true, type: :system do

  before do
    @admin = create(:admin)
    @user = create(:user)
    sign_in @admin
  end

  context "adminでログインした時" do
    it "ユーザーを削除できる" do
      visit edit_admin_registration_path
      click_link @user.id.to_s  #capybaraで警告が出るのでto_s追加
      expect{
        expect(page.accept_confirm).to eq "削除しますか?"
        expect(page).to have_content "ユーザーを削除しました。"
        }. to change(User, :count).by(-1)
    end
  end
end
