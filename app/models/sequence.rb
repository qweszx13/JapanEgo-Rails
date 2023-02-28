class Sequence < ApplicationRecord
  validates :NAME, presence: true
  validates :CURRVAL, presence: true
end