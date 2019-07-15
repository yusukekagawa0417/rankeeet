class RankingsController < ApplicationController

  def index
    @rankings = Ranking.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20).page(params[:page]).per(20)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @ranking = Ranking.find(params[:id])

    @items = Item.where(ranking_id: params[:id]).select('items.*', 'count(votes.id) AS vots')
    .left_joins(:votes)
    .group('items.id')
    .order('vots desc')

    gon.data = []
    gon.namedata = []
    @items.each do |item|
      gon.data << item.votes.length
      gon.namedata << item.name
    end

    @vote = Vote.new
  end

  def new
    @ranking = Ranking.new
  end

  def create
    @ranking = Ranking.new(ranking_params)

    if @ranking.save
      redirect_to new_ranking_item_path(@ranking.id)
    else
      render :new
    end
  end


  private

  def ranking_params
    params.require(:ranking).permit(:name).merge(user_id: current_user.id)
  end

end
