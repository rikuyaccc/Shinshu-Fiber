class UsersController < ApplicationController

  def index 
    @users = User.all
  end
  
  def show
    @reviews = Review.all
    @user = User.find(params[:id])
    #エントリーテーブルの中から、ログインユーザーのidを抽出
    @currentUserEntry = Entry.where(user_id: current_user.id)
    #エントリーテーブルの中から詳細ユーザーのidを抽出
    @userEntry = Entry.where(user_id: @user.id)
    #ログインユーザーと詳細ユーザーで同じroom_idを探す
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          #一致するroom_idがあった場合
          if cu.room_id == u.room_id
            @haveRoom = true
            @roomId = cu.room_id
          end
        end
      end
      #お互いに一致するroom_idがなかった場合
      unless @haveRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  #自分がフォローしているユーザ一覧
  def follows
    @user = User.find(params[:id])
    #エントリーテーブルの中から、ログインユーザーのidを抽出
    @currentUserEntry = Entry.where(user_id: current_user.id)
    #エントリーテーブルの中から詳細ユーザーのidを抽出
    @userEntry = Entry.where(user_id: @user.id)
    #ログインユーザーと詳細ユーザーで同じroom_idを探す
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          #一致するroom_idがあった場合
          if cu.room_id == u.room_id
            @haveRoom = true
            @roomId = cu.room_id
          end
        end
      end
      #お互いに一致するroom_idがなかった場合
      unless @haveRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
    #ユーザーのフォロー一覧
    @users = @user.followings
  end

  #自分をフォローしているユーザ一覧
  def followers
    @user = User.find(params[:id])
    #エントリーテーブルの中から、ログインユーザーのidを抽出
    @currentUserEntry = Entry.where(user_id: current_user.id)
    #エントリーテーブルの中から詳細ユーザーのidを抽出
    @userEntry = Entry.where(user_id: @user.id)
    #ログインユーザーと詳細ユーザーで同じroom_idを探す
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          #一致するroom_idがあった場合
          if cu.room_id == u.room_id
            @haveRoom = true
            @roomId = cu.room_id
          end
        end
      end
      #お互いに一致するroom_idがなかった場合
      unless @haveRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
    #ユーザーのフォロワー一覧
    @users = @user.followers
  end

end
