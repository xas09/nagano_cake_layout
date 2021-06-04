class Order < ApplicationRecord
  enum status: {
    unpaid: 0,
    paid: 1,
    making: 2,
    preparing: 3,
    shipped: 4,
  }
  enum payment_method: {
    card: 0,
    bank: 1
  }
  
  belongs_to :end_user
  has_many :order_details, dependent: :destroy
end
