class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :subtotal, :gst_amount, :pst_amount, :hst_amount, :total, presence: true
  validates :status, presence: true
end