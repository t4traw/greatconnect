class RoomsController < ApplicationController
  def create
    @room = Room.create
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(entry_params)
    redirect_to "/rooms/#{@room.id}"
  end
  
  def show
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def index
    @user = current_user
    @currentEntries = current_user.entries
    myRoomIds = []

    @currentEntries.each do | entry |
      myRoomIds << entry.room.id
    end

    @anotherEntries = Entry.where(room_id: myRoomIds).where('user_id != ?', @user.id)
  end
  
  private
  def entry_params
    params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id)
  end
end

