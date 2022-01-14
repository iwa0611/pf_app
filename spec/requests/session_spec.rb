require 'rails_helper'

RSpec.describe "SessionsController", type: :request do
  describe "ログインしないでマイページを開いた時" do
    
    before do
      get hobbyspot_users_mypage_path
    end

    it "ログインページに移動する" do
      expect(response).to redirect_to hobbyspot_user_session_path
    end
  end

  describe "ログインしないで投稿ページを開いた時" do

    before do
      get new_hobbyspot_post_path
    end

    it "ログインページに移動する" do
      expect(response).to redirect_to hobbyspot_user_session_path
    end
  end

  describe "ログインした時" do

    before do
      get hobbyspot_path
      login_user
      post hobbyspot_user_session_path
    end

    it 'TOPページが表示される' do
      expect(controller.hobbyspot_user_signed_in?).to be true
      expect(response).to redirect_to hobbyspot_path
    end
  end
end

