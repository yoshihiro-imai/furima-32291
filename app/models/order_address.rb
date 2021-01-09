class OrderAddress 

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id

  attr_accessor :token


  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]\d{1,11}\z/}
    validates :token
  end

  validates :prefecture_id,  numericality: { other_than: 1}

  def save

    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,building_name: building_name, phone_number: phone_number,order_id:order.id)

  end


end