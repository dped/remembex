class GameTwoSession < ApplicationRecord
  belongs_to :text_paragraph
  belongs_to :game

  def chop_paragraph
    text = text_paragraph.content.split(/\b/)
    count = 0
    text.map! do |word|
      if count == 0 && word.match(/\w+/)
        { secret_word: word }
      else
        word
      end
    end
  end
end
