class Hobbyspot::CommentsController < ApplicationController
  before_action :authenticate_hobbyspot_user!, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    flash[:notice] = "投稿しました。"
    redirect_to hobbyspot_post_path("#{@comment.post_id}")
  end

  def destroy
    if hobbyspot_user_signed_in? || admin_signed_in?
      comment = Comment.find_by(id: params[:id])
      comment.destroy
      flash[:notice] = "削除しました。"
      redirect_to hobbyspot_post_path(comment.post.id)
    end
  end

  private

  def comment_params
    params[:comment].permit(:post_id, :body, :user_name, :user_id)
  end
end
