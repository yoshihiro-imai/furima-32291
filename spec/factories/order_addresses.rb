FactoryBot.define do
  
  factory :order_address do
    
   
    token         {"tok_d2998f45c67c8d9b7457ccfb7e98"}
    postal_code  {'123-4567'}
    prefecture_id { 2 } 
    city          {"テスト"}
    house_number {"テスト"}
    building_name {"テスト"}
    phone_number  {"123456100"}

  end
end
