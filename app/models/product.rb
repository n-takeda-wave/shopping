class Product < ApplicationRecord
  mount_uploader :picture, PictureUploader
  
  validates :image, presence: false
  validates :title, presence: true, length: {maximum:100}
  validates :capture, presence: false, length: {maximum:500}
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }
end
