class Word < ApplicationRecord
  validates :NO, presence: true
  validates :WORD, presence: true
  validates :HURIGANA, presence: true
  validates :OKURIGANA, presence: true
  validates :YOMIGANA, presence: true
  validates :MEAN, presence: true
  validates :GRADE, presence: true
end