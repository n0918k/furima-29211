FactoryBot.define do
  factory :user_item do
    number { '4242424242424242' }
    token{'jhlfghsfghihilh'}
    house_number { '123-4567' }
    prefecture_id { '1' }
    city { 'aaa' }
    address { 'aaa' }
    phone_number { '09012345678' }
    exp_month { '12' }
    exp_year { '24' }
    cvc { '123' }
  end
end
