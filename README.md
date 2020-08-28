# テーブル設計

## users テーブル
|種類 |Column|Type|Options|
|:----|:----|:----|:----|
|ニックネーム|nickname|string|null:false|
|苗字  |first_name|string|null:false|
|名前|last_name|string|null:false|
|苗字(かな)|first_name_kana|string|null:false|
|名前(かな)|last_name_kana|string|null:false|
|メールアドレス|email|string|null:false|
|パスワード|password|string|null:false|
|生年月日|birthday|date|null:false|
### Association
- has_many :items
- has_many :comments
- has_one :purchase

## items テーブル
|種類|Column|Type|Options|備考|
|:----|:----|:----|:----|:----|
|画像|||| ActiveStorage|
|商品名|item_name|string| | |
|商品説明|instruction|text| | |
|送料負担|postage|string| | |
|価格|price|integer| | |
|カテゴリー|category|integer| |Activehash|
|発送までの日数|shipping_days|integer| |Activehash|
|状態|item_status|integer| |Activehash|
|発送元地域|sipping_origin|integer| |Activehash|
### Association
- belongs_to :user
- has_many :comments
- has_one :purchase

## comments テーブル
|Column|Type|Options|
|:----|:----|:----|
|comment|string| |
|users_id|references |null: false, foreign_key: true|
|items_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## purchases テーブル
種類|Column|Type|Options|備考|
|:----|:----|:----|:----|:----|
|郵便番号|house_number|integer|null:false|
|都道府県|prefecture|integer|null:false|Activehash|
|市区町村|city|string|null:false| |
|番地|address|string|null:false| |
|建物|building_name|string| | |
|電話番号|phone_number|integer|null:false| |
|購入者|users_id|references |null: false, foreign_key: true| |
|購入した商品|items_id|references|null: false, foreign_key: true| |
### Association
- belongs_to :user
- belongs_to :item