FactoryBot.define do #FactoryBot設定
  factory :user do
    nick_name              {"テスト"}
    email                 {Faker::Internet.free_email}
    password             {"123zxc"}
    password_confirmation {password}
    first_name            {"名前"}
    last_name             {"名前"}
    first_name_kana       {"カナ"}
    last_name_kana        {"カナ"}
    birthday               {"1931-01-02"}
  end
end