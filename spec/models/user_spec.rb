require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー情報' do
    it "nickname,email,password,password_confirmation,last_name,first_name,last_name_reading,first_name_reading,birthdayが存在すれば登録できる" do
      expect(@user).to be_valid
    end

    
    it  "nick_nameが必須であること" do
    @user.nick_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
    it "メールアドレスが必須であること" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意性があること" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスは、＠を含む必要があること" do
      @user.email = "123456"
      @user.valid?
      
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが必須であること" do

      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
   
    end
    it "パスワードは、６文字以上で入力が必須であること" do
      @user.password = "123zxc"
      expect(@user).to be_valid
    end
    it "パスワードは、5文字以下であれば登録ができないということ" do
     @user.password = "12345"
     @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")

    end
    it "パスワードは、半角英数字混合での入力が必要であること" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")

    end
    it "パスワードは、確認用を含めて２回入力すること" do
      @user.password = "123zxc"
      @user.password_confirmation = "123zxc"
      expect(@user).to be_valid

    end
    it "パスワードとパスワード（確認用）、値が一致が必須であること" do
      @user.password = "123zxc"
      @user.password_confirmation = "zxc123"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードは、数字だけでは登録ができないということ" do
      @user.password = "123123"
      @user.password_confirmation = "123123"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "パスワードは、半角英語のみでは登録ができないということ" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "パスワードは全角では登録ができないということ" do
      @user.password = "１２３zxc"
      @user.password_confirmation = "１２３zxc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
  end

  describe "新規登録/本人情報確認" do
    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.first_name = "テスト"
      @user.last_name = ""  
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角文字で入力してください")
    end
    it "ユーザー本名は、全角（漢字、平仮名、カタカナ）での入力が必須であること" do
      @user.first_name = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字で入力してください")

    end
    it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
       @user.first_name_kana = ""
       @user.last_name_kana = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana 全角カタカナのみで入力して下さい", "Last name kana can't be blank", "Last name kana 全角カタカナのみで入力して下さい")
    end
    it "ユーザー本名のフリガナは、全角（カタカナ）で入力が必須であること" do
      @user.first_name_kana = "あああ"
       @user.last_name_kana = "ooo"
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kana 全角カタカナのみで入力して下さい", "Last name kana 全角カタカナのみで入力して下さい")

    end
    it "生年月日が必須であること" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
