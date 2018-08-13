class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: :false },  length: { minimum: 6, maximum: 30}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 200 }, uniqueness: {case_sensitive: true}, format: {with: VALID_EMAIL_REGEX}

end