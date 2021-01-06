class ItemsController < ApplicationController 

  before_action :authenticate_user!, except: [:index, :show]  
 

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create

    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
     else
      render :new  
    end

  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user.id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
      else
        render action: :edit
    end

  end



  private

  def item_params

    params.require(:item).permit(:title,:image,:explanation,:category_id,:state_id,:fee_id,:prefecture_id,:delivery_days_id,:price).merge(user_id: current_user.id)
  
  end

end
