class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image

  has_many :product_tags, dependent: :destroy
  has_many :tags, through: :product_tags
  has_many :order_items, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :category, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ["category_id", "created_at", "description", "id", "price", "stock_quantity", "title", "updated_at"]
  end

  def self.ransackable_associations(_auth_object = nil)
    ["category", "product_tags", "tags"]
  end

  def thumbnail_image
    image.variant(resize_to_limit: [300, 300]).processed if image.attached?
  end

  def large_image
    image.variant(resize_to_limit: [800, 800]).processed if image.attached?
  end
end