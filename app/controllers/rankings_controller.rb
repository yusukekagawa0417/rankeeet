class RankingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @rankings = Ranking.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20).page(params[:page]).per(20)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @ranking = Ranking.find(params[:id])

    items_ids = Vote.where(ranking_id: params[:id]).group(:item_id).order('count_item_id DESC').count(:item_id).keys
    @items = items_ids.map { |id| Item.find(id) }  

    gon.data = []
    gon.namedata = []
    @items.each do |item|
      gon.data << item.votes.length
      gon.namedata << item.name
    end

    @vote = Vote.new

    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end

  def new
    @ranking = Ranking.new
  end

  def create
    @ranking = Ranking.new(ranking_params)

    if @ranking.save
      redirect_to new_ranking_item_path(@ranking.id)
    else
      flash.now[:alert] = "同じ名前のランキングが既に存在します"
      render :new 
    end
  end

  def destroy
    ranking = Ranking.find(params[:id])
    ranking.destroy
    redirect_to rankings_path
  end

  private

  def ranking_params
    params.require(:ranking).permit(:name).merge(user_id: current_user.id)
  end

end
