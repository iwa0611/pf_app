require "rails_helper"

RSpec.describe Hobbyspot::PostsController, js: true, type: :system do

  before do
    @post = create(:post)
    visit root_path
    visit new_admin_registration_path
    fill_in "admin[email]", with: "test@1.com"
    fill_in "admin[password]", with: "123456"
    fill_in "admin[password_confirmation]", with: "123456"
    click_button "SignUp"
  end

  describe "ログインした状態で" do
    it "投稿ができる" do
      visit "/hobbyspot/posts/new"
      fill_in_rich_text_area "post_body", with: "content"
      expect{ click_button "投稿" }.to change(Post, :count).by(1)
      expect(current_path).to eq hobbyspot_path
    end

    it "編集ができる" do
      click_link "post_#{@post.id}" 
      click_link "編集"
      click_button "編集"
      expect(page).to have_content "更新しました。"
    end

    it "削除ができる" do
      click_link "post_#{@post.id}" 
      click_link "削除"
      expect{
        expect(page.accept_confirm).to eq "削除しますか？"
        expect(page).to have_content "削除しました。"
        }. to change(Post, :count).by(-1)
    end
  end
end
