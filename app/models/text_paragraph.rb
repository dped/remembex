class TextParagraph < ApplicationRecord
  has_many :game_sessions, dependent: :destroy
  belongs_to :full_text
  validates :content, presence: true
  validates :order_number, presence: true
end
