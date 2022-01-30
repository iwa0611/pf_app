class Hobbyspot::UsersController < ApplicationController
  before_action :authenticate_hobbyspot_user!, only: :mypage
  before_action :authenticate_admin!, only: :destroy

  def mypage
    @user = User.find_by(id: current_hobbyspot_user)
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    flash[:notice] = "ユーザーを削除しました。"
    redirect_to edit_admin_registration_path
  end
end
