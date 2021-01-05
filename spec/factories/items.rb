FactoryBot.define do
  factory :item do
    title                  {"テスト"}
    explanation            {"テスト"}
    category_id            { "2" }
    state_id                { "2" }
    fee_id                 { "2" }
    prefecture_id          { "2" }
    delivery_days_id       { "2" }
    price                  { "500" }

    association :user
    
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end    
  end  
end