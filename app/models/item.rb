class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :fee
  belongs_to :delivery_days
  belongs_to :prefecture
  belongs_to :state
  has_one :order
  

  
  with_options presence: true do
    validates :title 
    validates :explanation
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :delivery_days_id
      validates :fee_id
      validates :prefecture_id
      validates :state_id
     end
    validates :price,             numericality:{greater_than:300,less_than:9999999}
    validates :price,format:{with: /\A([1-9]\d*,)*[1-9]\d*\z/ }
  end
end
