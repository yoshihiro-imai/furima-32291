require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

    before do     
       @user = FactoryBot.create(:user)
       @item = FactoryBot.create(:item) 
       @order_address = FactoryBot.build(:order_address,user_id: @user.id,item_id: @item.id)
       sleep 0.1    
    end

 context '商品が購入できる時' do

  it "全ての値が正しく入力されていれば保存ができること" do
    expect(@order_address).to be_valid
  end

  it "建物名の情報がなくても商品を購入することができる。" do
    @order_address.building_name = nil
    expect(@order_address).to be_valid
  end

 end

 context '商品が購入できない時' do
 

  it "クレジット情報が無いときは購入ができない" do    
    @order_address.token = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Token can't be blank")
  end

  it "購入時には郵便番号の情報が必須であること" do
    @order_address.postal_code = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")    
  end

  it "郵便番号にはハイフンが必須であること" do
    @order_address.postal_code = '4441234'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code is invalid")
        
  end

  it "都道府県の情報が何も選択していない場合には購入ができないということ" do

    @order_address.prefecture_id = 1
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
 
  end

  it "購入には市区町村の情報が必須であること" do
    @order_address.city = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("City can't be blank")
        
  end

  it "購入には番地の情報が必須であること" do
    @order_address.house_number = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("House number can't be blank")
        
  end


  it "購入には電話番号の情報が必須であること" do 
    @order_address.phone_number = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number can't be blank")   
  end

  it "電話番号にはハイフンは不要であること" do    
    @order_address.phone_number = '080-1234-1234'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is invalid")
        
  end

  it "電話番号は12桁以上は入力ができないということ" do    
    @order_address.phone_number = '08011234111234'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is invalid")
        
  end
  it "電話番号は英数字混合では入力ができないということ" do    
    @order_address.phone_number = 'abcd123'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is invalid")
        
  end

  it "user_idが空では登録が出来ないということ" do
    @order_address.user_id = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("User can't be blank")
  end

  it "item_idが空では登録が出来ないということ" do
    @order_address.item_id = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Item can't be blank")
  end

 end
end
