class MessagesController < ApplicationController
  def create
    if current_user.entries.where(room_id: message_params[:room_id]).present?
      @message = Message.create(message_params)
    else
      flash[:alert] = "メッセージの送信に失敗しました"
    end
      redirect_to room_path(@message.room_id)
  end
  
  private
  def message_params
    params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id)
  end
  
end
