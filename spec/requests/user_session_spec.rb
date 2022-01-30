require 'rails_helper'

RSpec.describe "UserSessionsController", type: :request do
  describe "ログインしないでマイページを開いた時" do
    before do
      get hobbyspot_users_mypage_path
    end

    it "ログインページに移動する" do
      expect(response).to redirect_to root_path
    end
  end

  describe "ログインした時" do
    before do
      get hobbyspot_path
      login_user
      post hobbyspot_user_session_path
    end

    it "TOPページが表示される" do
      expect(controller.hobbyspot_user_signed_in?).to be true
      expect(response).to redirect_to hobbyspot_path
    end

    it "ユーザー名が表示される" do
      get hobbyspot_path
      expect(response.body).to include @user.name
    end

    it "ユーザーのメニューが表示される" do
      get hobbyspot_path
      expect(response.body).to include 'マイページ'
      expect(response.body).to include 'ログアウト'
    end

    it "マイページが表示される" do
      get hobbyspot_users_mypage_path
      expect(response).to have_http_status 200
    end
  end
end
