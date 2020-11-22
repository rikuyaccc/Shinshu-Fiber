class RelationshipsController < ApplicationController

  #フォローする
  def create
    follow = current_user.active_relationships.new(follower_id: params[:user_id])
    follow.save
    @user = User.find(params[:user_id])
    redirect_to request.referer
  end

  #アンフォローする
  def destroy
    follower = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follower.destroy
    @user = User.find(params[:user_id])
    redirect_to request.referer
  end
end