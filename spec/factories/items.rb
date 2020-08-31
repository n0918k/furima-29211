FactoryBot.define do
  factory :item do
    association :user
    association :prefecture
    association :item_status
    association :shipping_day
    association :category

    name {'あああ'}
    instruction{'あああ'}
    postage_id{'1'}
    price{'500'}
    category_id{'1'}
    shipping_day_id{'1'}
    item_status_id{'1'}
    prefecture_id{'1'}
    
  end
end
