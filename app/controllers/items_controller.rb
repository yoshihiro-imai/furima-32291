class ItemsController < ApplicationController 

  before_action :authenticate_user!, except: [:index, :show]  
  before_action :set_item, only: [:show,:edit,:update,:destroy]

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
  
  end

  def edit
    
    unless @item.user.id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    unless @item.user.id == current_user.id
      redirect_to action: :index
    end
    if @item.update(item_params)
      redirect_to item_path    
      else
        render action: :edit
    end
  end

  def destroy
    unless @item.user.id == current_user.id
      redirect_to action: :index
    end
    @item.destroy
    redirect_to root_path
  end




  private

  def item_params

    params.require(:item).permit(:title,:image,:explanation,:category_id,:state_id,:fee_id,:prefecture_id,:delivery_days_id,:price).merge(user_id: current_user.id)
  
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
