class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :fee
  belongs_to :delivery_days
  belongs_to :prefecture
  belongs_to :state

  
  with_options presence: true do
    validates :title 
    validates :explanation
    validates :image
    validates :category_id,numericality: { other_than: 1 }
    validates :delivery_days_id,  numericality: { other_than: 1 }
    validates :fee_id,            numericality: { other_than: 1 }
    validates :prefecture_id,     numericality: { other_than: 1 }
    validates :state_id,          numericality: { other_than: 1 }
    validates :price,             numericality:{greater_than:300,less_than:9999999}
    validates :price,format:{with: /\A([1-9]\d*,)*[1-9]\d*\z/ }
  end
end
