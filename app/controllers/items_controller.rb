class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
    @categories = []
    @categories << Category.new(id: 0,name:"---")
    Category.where(ancestry: nil).each do |category|
      @categories << category
    end
  end
  def create
    Item.create(item_params)
    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:category_id)
  end
end