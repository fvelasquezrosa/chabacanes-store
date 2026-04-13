class Province < ApplicationRecord
  has_many :users

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
  validates :gst_rate, :pst_rate, :hst_rate, presence: true
end