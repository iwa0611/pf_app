require 'rails_helper'

RSpec.describe "UsersRegistrationsController", js: true, type: :system do
  before do
    @user = create(:user)
  end

  context "未ログインの時" do
    it "アカウントが作成できる" do
      visit new_hobbyspot_user_registration_path
      fill_in "hobbyspot_user[email]", with: "test@1.com"
      fill_in "hobbyspot_user[name]", with: "hoge"
      fill_in "hobbyspot_user[password]", with: "123456"
      fill_in "hobbyspot_user[password_confirmation]", with: "123456"
      expect { click_button "アカウント作成" }.to change(User, :count).by(1)
      expect(page).to have_content "アカウント登録が完了しました。"
    end
  end

  context "アカウントを作った時" do
    it "ログインができる" do
      visit new_hobbyspot_user_session_path
      fill_in "hobbyspot_user[email]", with: "#{@user.email}"
      fill_in "hobbyspot_user[password]", with: "#{@user.password}"
      click_button "ログイン"
      expect(page).to have_content "ログインしました。"
    end
  end

  context "ログインした状態で" do
    it "プロフィール編集ができる" do
      sign_in @user
      visit hobbyspot_users_mypage_path
      click_link "プロフィール編集"
      fill_in "hobbyspot_user[name]", with: "hoge"
      fill_in "hobbyspot_user[current_password]", with: "#{@user.password}"
      click_button "編集"
      expect(page).to have_content "更新しました"
    end

    it "アカウントが削除できる" do
      sign_in @user
      visit edit_hobbyspot_user_registration_path
      click_button "アカウント削除"
      expect  do
        expect(page.accept_confirm).to eq "削除しますか?"
        expect(page).to have_content "アカウントを削除しました"
      end. to change(User, :count).by(-1)
    end
  end
end
