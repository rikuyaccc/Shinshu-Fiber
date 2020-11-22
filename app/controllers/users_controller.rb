class UsersController < ApplicationController

  def index 
    @users = User.all
  end
  
  def show
    @reviews = Review.all
    @user = User.find(params[:id])
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @haveRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @haveRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  #自分がフォローしているユーザ一覧
  def follows
    @user = User.find(params[:id])
    @users = @user.followings
  end

  #自分をフォローしているユーザ一覧
  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

end
