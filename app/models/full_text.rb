class FullText < ApplicationRecord
  has_many :text_paragraphs, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :percentage, inclusion: (0..100), null: false

  def generate_paragraphs(content)
    dividers = %w[. ? !]
    sentences = []
    paragraph = ""
    content = content.gsub(/[\n\r]/, ' ')
    content.split(/\b/).each do |word|
      if (paragraph.length > 200 && dividers.any? { |divider| word.include?(divider) })
        sentences << (paragraph + word).strip
        paragraph = ""
      else
        paragraph += word
      end
    end
    sentences << paragraph unless paragraph.empty?
    sentences.each_with_index do |sentence, idx|
      text_paragraph = TextParagraph.new(content: sentence, order_number: idx + 1)
      text_paragraph.full_text = self
      text_paragraph.save
    end
  end
end
