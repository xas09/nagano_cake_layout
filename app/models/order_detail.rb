class OrderDetail < ApplicationRecord
  enum making_status: {
    unready: 0,
    waiting: 1,
    making: 2,
    done: 3
  }
  
  belongs_to :order
  belongs_to :item
end
