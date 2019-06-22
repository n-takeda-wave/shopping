class Store < ApplicationRecord
  has_secure_password
  before_save { self.email.downcase! }
  has_many :products
  
  validates :name, presence: true, length: {maximum:100}
  validates :email, presence:true, length: {maximum:255}, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness: { case_sensitive: false }
  
end
