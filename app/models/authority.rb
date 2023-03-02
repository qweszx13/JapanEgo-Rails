class Authority < ApplicationRecord
  validates :MEMBER_NO, presence: true
  validates :AUTHORITY, presence: true
end