require 'rails_helper'

RSpec.describe "AdminSessionsController", type: :request do
  describe "ログインしないでを開いた時" do
    before do
      get edit_admin_registration_path
    end

    it "ログインページに移動する" do
      expect(response).to redirect_to root_path
    end
  end

  describe "ログインした時" do
    before do
      get hobbyspot_path
      login_admin
      post admin_session_path
    end

    it 'TOPページが表示される' do
      expect(controller.admin_signed_in?).to be true
      expect(response).to redirect_to hobbyspot_path
    end

    it 'adminと表示される' do
      get hobbyspot_path
      expect(response.body).to include 'admin'
    end

    it 'adminのメニューが表示される' do
      get hobbyspot_path
      expect(response.body).to include '管理画面'
      expect(response.body).to include '投稿'
      expect(response.body).to include 'ログアウト'
    end
  end
end
