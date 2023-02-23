class Word < ApplicationRecord
  validates :no, presence: true
  validates :word, presence: true
  validates :hurigana, presence: true
  validates :okurigana, presence: true
  validates :yomigana, presence: true
  validates :mean, presence: true
  validates :grade, presence: true
end