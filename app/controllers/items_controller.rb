class ItemsController < ApplicationController
  
  before_action :set_store
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @store.items
  end

  def show
  end

  def new
    @item = @store.items.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @item = @store.items.new(item_params)
    if @item.save
      redirect_to [@store, @item]
    else
      redner :new 
    end
  end

  def update
    if @item.update(item_params)
      redirect_to [@store, @item]
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to store_items_path
  end

  private
  
  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price)
  end 
end
