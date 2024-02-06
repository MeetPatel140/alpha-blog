class User < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :username, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.([a-z]{2,})\Z/i }
  validates :password, presence: true, length: { minimum: 8, maximum: 50 }
end
