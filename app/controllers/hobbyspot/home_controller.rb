class Hobbyspot::HomeController < ApplicationController
  def index
    @posts = Post.all.with_rich_text_body_and_embeds
    if hobbyspot_user_signed_in?
      @user = User.find_by(id: current_hobbyspot_user)
    end
  end
end
