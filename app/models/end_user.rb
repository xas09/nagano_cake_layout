class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :zip_code
    validates :address
    validates :phone_number
  end
  
  has_many :cart_items, dependent: :destroy 
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  def active_for_authentication?
    super && (self.is_unsubscribed == false)
  end

end
