class Product < ApplicationRecord
  belongs_to :store
  mount_uploader :image, ImageUploader
  
  validates :image, presence: false
  validates :title, presence: true, length: {maximum:100}
  validates :capture, presence: false, length: {maximum:500}
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }
  
  def self.search(search)
    if search
      where(['title LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
