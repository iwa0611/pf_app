class Hobbyspot::HomeController < ApplicationController
  def index
    @posts = Post.all
    if hobbyspot_user_signed_in?
      @user = User.find_by(id: current_hobbyspot_user)
    end
  end
end
