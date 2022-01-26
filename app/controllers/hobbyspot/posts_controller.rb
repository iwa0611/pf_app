class Hobbyspot::PostsController < ApplicationController
  before_action :authenticate_admin!, except: [:show]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to hobbyspot_path
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(edit_params)
      flash[:notice] = "更新しました"
      redirect_to hobbyspot_path
    else
      flash[:notice] = "更新できませんでした"
      redirect_to "/hobbyspot/posts/#{@post.id}/edit"
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy
    redirect_to hobbyspot_path
  end

  private

  def post_params
    params.permit(:body)
  end

  def edit_params
    params.require(:post).permit(:body)
  end
end
