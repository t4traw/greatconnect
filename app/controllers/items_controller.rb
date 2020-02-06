class ItemsController < ApplicationController
  def index
    @search = Item.search(params[:q])
    @items = @search.result.page(params[:page]).per(2)
    #@items = Item.page(params[:page]).per(2)
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
    @item = current_user.items.find(params[:id])
  end
  
  def update
    @item = current_user.items.find(params[:id]) 
    @item.update(item_params)
    redirect_to root_path, success: '投稿を編集しました'
  end
    
  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
    redirect_to root_path, success: '投稿を削除しました'
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :product, :price, :description)
  end
  
end
