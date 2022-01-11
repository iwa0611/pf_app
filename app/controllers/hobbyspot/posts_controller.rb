class Hobbyspot::PostsController < ApplicationController
  def new
    @user = User.find_by(id: current_hobbyspot_user)
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to hobbyspot_users_mypage_path
  end

  def update
  end

  def edit
  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy
    redirect_to hobbyspot_users_mypage_path
  end

  private

  def post_params
    params.permit(:body, :user_id, :image, :user_name)
  end
end
