require 'rails_helper'

RSpec.describe "Hobbyspot::Posts", type: :request do
  let(:post) { create(:post) }

  describe "ユーザーの時" do
    it "投稿詳細ページが開ける" do
      get hobbyspot_post_path(id: post.id)
      expect(response).to have_http_status 200
    end

    it "編集ページを開くとリダイレクトされる" do
      get edit_hobbyspot_post_path(id: post.id)
      expect(response).to redirect_to root_path
    end

    it "投稿ページを開くとリダイレクトされる" do
      get new_hobbyspot_post_path
      expect(response).to redirect_to root_path
    end
  end
  
  describe "adminの時" do

    before do
      get hobbyspot_path
      login_admin
    end

    it "投稿ページが開ける" do
      get new_hobbyspot_post_path
      expect(response).to have_http_status 200
    end

    it "投稿編集ページを開ける" do
      get edit_hobbyspot_post_path(id: post.id)
      expect(response).to have_http_status 200
    end
  end
end
