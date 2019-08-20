class GameSessionsController < ApplicationController
  def show
    @game_session = GameSession.find(params[:id])
  end

  # def insert_word_game(words)
  #   text = words.split
  #   text.map.with_index do |word, idx|
  #     idx % 6 == 0 ? "_" * text.length : text
  #   end.join
  # end
end


