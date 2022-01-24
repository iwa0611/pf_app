class Hobbyspot::UsersController < ApplicationController
  before_action :authenticate_hobbyspot_user!

  def mypage
    @user = User.find_by(id: current_hobbyspot_user)
    @posts = @user.posts
  end
end
