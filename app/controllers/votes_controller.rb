class VotesController < ApplicationController


  def create

    votes = Vote.where(user_id: current_user.id, ranking_id: params[:ranking_id])
    sum_quantity = votes.length

    if sum_quantity < 5
      @vote = Vote.new(vote_params)
      @vote.save
    else
      flash.now[:alert] = "残りの票がありません"
    end

    redirect_to ranking_path(params[:ranking_id])    
  end

 
  def destroy
    Vote.where(item_id: params[:item_id], user_id: current_user.id).destroy_all  
    redirect_to ranking_path(params[:ranking_id]) 
  end

  private

  def  vote_params
    params.require(:vote).permit(:quantity).merge(ranking_id: params[:ranking_id], user_id: current_user.id, item_id: params[:item_id])
  end

end