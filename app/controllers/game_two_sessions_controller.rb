class GameTwoSessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:guess_word]
  def show
    @game_two_session = GameTwoSession.find(params[:id])
    @chopped_paragraph = @game_two_session.chop_paragraph
    @chopped_only_text = []
    @chopped_paragraph.each{|text| @chopped_only_text << text[:secret_word] if text.class ==Hash }
    input_count = @chopped_paragraph.count { |element| element.is_a? Hash }
    @game_two_session.number_of_inputs = input_count
    @game_two_session.number_of_right_inputs = 0
    @game_two_session.save
  end

  def new
    @game_two_session = GameTwoSession.new
  end

  def create
    @game_two_session = GameTwoSession.new
    @text_paragraph = TextParagraph.find(params[:text_paragraph_id])
    @game_two_session.text_paragraph = @text_paragraph
    @game_two_session.game = Game.last
    if @game_two_session.save
      redirect_to game_two_session_path(@game_two_session)
    else
      render :new
    end
  end

  def guess_word
    @game_two_session = GameTwoSession.find(params[:id])
    if params[:guess].downcase == params[:answer].downcase
      @game_two_session.number_of_right_inputs += 1
      @game_two_session.save!
      render json: {success: true}
    else
      render json: {success: false}
    end
  end

  def final_score
    @game_two_session = GameTwoSession.find(params[:id])
    render json: { finalScore: @game_two_session.number_of_right_inputs, inputs: @game_two_session.number_of_inputs}
  end
end
