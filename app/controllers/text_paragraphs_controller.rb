class TextParagraphsController < ApplicationController
  before_action :set_text_paragraph, only: :show

  skip_before_action :verify_authenticity_token, only: [:guess_word]

  def index
    @full_text = FullText.find(params[:full_text_id])
    @text_paragraphs = @full_text.text_paragraphs
  end

  def show
  end

  def done?
    if done
      # show it is done
    else
      # show it is not done
    end
  end

  def set_text_paragraph
    @text_paragraph = TextParagraph.find(params[:id])
  end
end
