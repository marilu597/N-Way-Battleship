class GamesController < ApplicationController

  def arrange_ships

  end

  def play

  end

  def refresh
    @my_turn = Player.find(params[:player_id]).turn
    respond_to do |format|
      format.json { render :json => { turn: @my_turn } }
    end
  end

end
