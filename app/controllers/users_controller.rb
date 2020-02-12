class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end  
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if current_user == @user
      if @user.update(user_params)
        redirect_to root_path, success: 'ユーザー情報を編集しました'
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました'
        render :edit
      end
    else
      redirect_to root_url
    end
  end

  

  
  def index
    @user_items = current_user.items
  end
  
  def show
    @user = User.find(params[:id])
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id 
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end  
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :age, :from, :email, :password, :password_confirmation)
  end
  
end
