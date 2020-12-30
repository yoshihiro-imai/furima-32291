class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do #バリデーションの設定
    validates :birthday
    validates :nick_name
    validates :first_name,:last_name,format:{
    with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "全角文字で入力してください"}
    validates :first_name_kana, :last_name_kana,format:{
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,message:"全角カタカナのみで入力して下さい"}
    validates  :password,format:{with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/}
  end
end
