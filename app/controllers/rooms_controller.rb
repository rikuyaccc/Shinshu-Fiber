class RoomsController < ApplicationController

  def index 
    #ログインユーザーが属しているルームidを全て抽出して配列化
    @current_entries = current_user.entries
    my_room_ids = []
    @current_entries.each do |entry|
      my_room_ids << entry.room.id
    end
    #user_iがログインユーザーでないレコードを抽出
    @another_entries = Entry.where(room_id: my_room_ids).where.not(user_id: current_user.id)
  end

  def create
    @room = Room.create
    @joinCurrentUser = Entry.create(user_id: current_user.id, room_id: @room.id)
    @joinUser = Entry.create(user_id: params[:entry][:user_id], room_id: @room.id)
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    #ログインユーザーが属しているルームidを全て抽出して配列化
    @current_entries = current_user.entries
    my_room_ids = []
    @current_entries.each do |entry|
      my_room_ids << entry.room.id
    end
    #user_iがログインユーザーでないレコードを抽出
    @another_entries = Entry.where(room_id: my_room_ids).where.not(user_id: current_user.id)
    
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages.includes(:user).order("created_at asc")
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
end