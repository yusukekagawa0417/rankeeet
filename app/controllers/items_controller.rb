class ItemsController < ApplicationController
  before_action :set_ranking

  def new
    @item = Item.new
    @items = Item.where(ranking_id: params[:ranking_id])
  end 
  
  def create
    @item = Item.new(item_params)
    @items = Item.where(ranking_id: params[:ranking_id])
    if @item.save
      redirect_to new_ranking_item_path(@ranking.id)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name).merge(ranking_id: params[:ranking_id]) 
  end

  def set_ranking
    @ranking = Ranking.find(params[:ranking_id])
  end

end
