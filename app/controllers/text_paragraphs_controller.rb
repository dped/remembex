class TextParagraphsController < ApplicationController
  before_action :set_text_paragraph, only: :show

  def index
    @text_paragraphs = Text_paragraph.all
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
    @text_paragraph = Text_paragraph.find(params[:id])
  end
end
