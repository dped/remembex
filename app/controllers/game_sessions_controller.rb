class GameSessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:guess_word]

  def show
    @game_session = GameSession.find(params[:id])
    @chopped_paragraph = @game_session.chop_paragraph
    input_count = @chopped_paragraph.count { |element| element.is_a? Hash }
    @game_session.number_of_inputs = input_count
    @game_session.number_of_right_inputs = 0
    @game_session.save
  end

  def new
    @game_session = GameSession.new
  end

  def create
    @game_session = GameSession.new
    @text_paragraph = TextParagraph.find(params[:text_paragraph_id])
    @game_session.text_paragraph = @text_paragraph
    @game_session.game = Game.first
    if @game_session.save
      redirect_to game_session_path(@game_session)
    else
      render :new
    end
  end

  def guess_word
    @game_session = GameSession.find(params[:id])
    if params[:guess].downcase == params[:answer].downcase
      @game_session.number_of_right_inputs += 1
      @game_session.save!
      render json: {success: true}
    else
      render json: {success: false}
    end
  end

  def final_score
    @game_session = GameSession.find(params[:id])
    render json: { finalScore: @game_session.number_of_right_inputs, inputs: @game_session.number_of_inputs}
  end

  def input_count
    @game_session = GameSession.find(params[:id])
    render json: {inputCount: @game_session.number_of_inputs}
  end

  # def insert_word_game(words)
  #   text = words.split
  #   text.map.with_index do |word, idx|
  #     idx % 6 == 0 ? "_" * text.length : text
  #   end.join
  # end
end
