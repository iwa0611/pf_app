require 'rails_helper'

RSpec.describe Hobbyspot::PostsController do

  before do
    @admin = create(:admin)
    sign_in @admin
  end
  
  describe "POST #create" do
    it "adminで投稿ができる" do
      expect{
        post :create, params: { post: { body: "test" }}
      }.to change(Post, :count).by(1)
    end
  end

  describe "GET #edit #update #delete" do
    let(:post) { create(:post, body: "test") }

    it "adminでeditが開ける" do
      get :edit, params: {id: post.id}
      expect(response).to have_http_status 200
    end

    it "adminで投稿をupdateできる" do
      patch :update, params: {post: attributes_for(:post, body: "test1"), id: post.id}
      expect(post.reload.body.to_s).to include "test1"
    end

    it "adminで投稿をdeleteできる" do
      post.body   #呼び出さないとdestroyが実行されない
      expect {
        delete :destroy, params: {id: post.id}
      }.to change(Post, :count).by(-1)
    end
  end
end
