class Hobbyspot::HomeController < ApplicationController
  def index
    @posts = Post.all.with_rich_text_body_and_embeds
    @admin = Admin.find_by(id: current_admin) if admin_signed_in?
    @user = User.find_by(id: current_hobbyspot_user) if hobbyspot_user_signed_in?
  end
end
