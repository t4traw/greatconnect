class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:like_users)
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = current_user.items.new(item_params)
    
    if @item.save
      redirect_to items_path, success: '商品を投稿しました'
    else
      flash.now[:danger] = "商品の投稿に失敗しました"
      render :new
    end
  end
  
  def edit
    @item = Item.find_by(id: params[:id])
  end
  
  def update
    @item = Item.find_by(id: params[:id]) 
    # test comment
  
    @item.update(item_params)
    redirect_to root_path, success: '投稿を編集しました'
  end
    
  def destroy
    @item = current_user.item.find(params[:id])
    @item.destroy
    redirect_to root_path, success: '投稿を削除しました'
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :product, :price, :description)
  end
end
