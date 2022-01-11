class Hobbyspot::UsersController < ApplicationController
  def sign_up
  end

  def login
  end

  def edit
  end

  def mypage
    @user = User.find_by(id: current_hobbyspot_user)
    @posts = @user.posts
  end
end
