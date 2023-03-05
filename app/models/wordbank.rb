class Wordbank < ApplicationRecord
  validates :NO, presence: true
  validates :OWNER_NO, presence: true
  validates :NAME, presence: true
  validates :CREATE_DATE, presence: true
  validates :MODIFIED_DATE, presence: true
  validates :DEL_FLAG, presence: true
end