class User < ApplicationRecord
  validates_presence_of :firstName
  validates_presence_of :lastName
  validates_presence_of :userName
  validates_numericality_of :mobile
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :bio, length: { minimum:10, maximum:100, message: "invalid"}
end
