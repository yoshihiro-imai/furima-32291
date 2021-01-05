require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  context '商品の出品が出来ない時' do

    it "商品の画像を１枚つけることが必須であること" do
    
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名の入力がなければ、出品が出来ないということ" do
    @item.title = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Title can't be blank")
    end

    it "商品の説明の入力が必須であること" do
    @item.explanation = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "カテゴリーの情報が何も選択できていない場合には登録ができないということ" do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "商品の情報が何も選択できていない場合には登録ができないということ" do
    @item.state_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("State must be other than 1")
    end
    it "配送料の情報が何も選択できていない場合には登録ができないということ" do
    @item.fee_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Fee must be other than 1")
    end
    it "発送元の地域の情報が何も選択していない場合には登録ができないということ" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")

    end
    it "発送までの日数についての情報が何も選択していない場合には登録ができないということ" do
      @item.delivery_days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery days must be other than 1")

    end
    it "価格についての情報が何も選択していない場合には登録ができないということ" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格の範囲が、300円未満の数値だと登録ができないということ" do
     @item.price = 250
     @item.valid?
     expect(@item.errors.full_messages).to include("Price must be greater than 300")

    end
    it "価格の範囲が、9999999円より大きい数値だと登録ができないということ" do
      @item.price = 1000000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999") 
    end
    it "販売価格は半角数字以外では登録ができないということ" do

      @item.price = "テスト"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
 
    end
  end

  context '商品の出品ができる時' do

    it "必要な情報を適切に入力すると、商品の出品ができること" do

      expect(@item).to be_valid
    end
  end  
  
end