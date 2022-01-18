require 'rails_helper'
require "spec_helper"

RSpec.describe Hobbyspot::PostsController, type: :controller do
  render_views
  
  before do
    visit hobbyspot_path
    login_user
    visit hobbyspot_user_session_path
    fill_in "hobbyspot_user[email]", with: "#{@user.email}"
    fill_in "hobbyspot_user[password]", with: "#{@user.password}"
    click_button "ログイン"
    visit '/hobbyspot/posts/new'
    fill_in "user_body", with: "Rspec test"
  end

  describe "ログインした状態で" do
    it "投稿ができる" do
      expect { click_button "投稿" }.to change(Post, :count).by(1)
    end
  end
end
