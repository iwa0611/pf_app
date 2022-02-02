require "rails_helper"

RSpec.describe Hobbyspot::CommentsController, js: true, type: :system do
  let(:comment) { create(:comment, post_id: @post.id, user_id: @user.id) }

  before do
    @user = create(:user)
    @admin = create(:admin)
    @post = create(:post)
  end

  context "adminにログインした状態で" do
    it "コメントを削除できる" do
      sign_in @admin
      visit hobbyspot_post_path(comment.post.id)
      click_link "del#{comment.id}"
      expect do
        expect(page.accept_confirm).to eq "削除しますか？"
        expect(page).to have_content "削除しました。"
      end. to change(Comment, :count).by(-1)
      expect(current_path).to eq hobbyspot_post_path(comment.post.id)
    end
  end

  context "ユーザーにログインした状態で" do
    before do
      sign_in @user
      visit hobbyspot_post_path(comment.post.id)
    end

    it "コメントできる" do
      fill_in "comment[body]", with: "comment"
      expect { click_button "送信" }.to change(Comment, :count).by(1)
      expect(current_path).to eq hobbyspot_post_path(comment.post.id)
    end

    it "コメントを削除できる" do
      click_link "del#{comment.id}"
      expect do
        expect(page.accept_confirm).to eq "削除しますか？"
        expect(page).to have_content "削除しました。"
      end. to change(Comment, :count).by(-1)
      expect(current_path).to eq hobbyspot_post_path(comment.post.id)
    end
  end
end
