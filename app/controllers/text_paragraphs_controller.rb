class TextParagraphsController < ApplicationController
  before_action :set_text_paragraph, only: :show

  def index
    @text_paragraphs = TextParagraph.all
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
