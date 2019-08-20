class GameSession < ApplicationRecord
  belongs_to :text_paragraph
  belongs_to :game

  def chop_paragraph
    text = text_paragraph.content.split(/\b/)
    count = 1
    magic_count = rand(3..8)
    text.map do |word|
      if count % magic_count == 0 && word.match(/\w+/)
        count = 1
        magic_count = rand(3..8)
        { secret_word: word }
      elsif word.match(/\w+/)
        count += 1
        word
      else
        word
      end
    end
  end
end
