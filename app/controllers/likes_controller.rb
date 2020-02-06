class LikesController < ApplicationController
  def index
    @like_items = current_user.like_items
  end
  
  def create
    like = Like.new
    like.user_id = current_user.id
    like.item_id = params[:item_id]
    if like.save
      redirect_to items_path, success: 'お気に入りに登録しました'
    else
      redirect_to items_path, danger: 'お気に入りに登録に失敗しました'
    end
  end 
  
  def destroy
    like = Like.find_by(user_id: current_user.id, item_id: params[:item_id])
    like.destroy if like.present?
    
    if like.destroyed?
      redirect_to items_path, success: 'お気に入りを解除しました'
    else
      redirect_to items_path, success: 'お気に入り解除に失敗しました'
    end
  end
  
end
