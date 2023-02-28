class Member < ApplicationRecord
  validates :NO, presence: true
  validates :EMAIL, presence: true
  validates :PASSWORD, presence: true
  validates :CREATE_DATE, presence: true
  validates :MODIFIED_DATE, presence: true
  validates :DEL_FLAG, presence: true
  validates :CERTIFY_FLAG, presence: true
  validates :GRADE, presence: true
end