class Order < ApplicationRecord
  
 
  has_one :card
  has_one :address
  belongs_to :item
  belongs_to :user

end
