class FullText < ApplicationRecord
  has_many :text_paragraphs
  belongs_to :user
  validates :title, presence: true
  validates :percentage, inclusion: { in: [0..100] }
end
