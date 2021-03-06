class PlayersController < ApplicationController

  def self.pass_turn(players)
    current_player = find_player_with_token(players)
    next_player = determine_next_player(players, current_player)
    if current_player # if it's not nil
      current_player.turn = false
      current_player.save
    end
    next_player.turn = true
    next_player.save
  end

  def self.find_player_with_token(players)
    players.each do |player|
      if player.turn
        return player
      end
    end
    nil # if no player has the token
  end

  def self.determine_next_player(players, current_player)
    # we determine the next player based on the player id
    players.sort_by! { |player| player[:id] }
    # just modify the previous line if you want to assign turns based on something different than the player id
    if current_player
      current_player_index = players.index(current_player)
      if current_player_index < players.size - 1
        return players[current_player_index + 1]
      else
        return players[0]  # return first player if the current player is the last of the list
      end
    else
      return players[0]  # return first player if none has the token
    end
  end

end
