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
- has_one :orders

## items テーブル
|種類|Column|Type|Options|備考|
|:----|:----|:----|:----|:----|
|画像|||null:false| ActiveStorage|
|商品名|name|string|null:false| |
|商品説明|instruction|text|null:false| |
|送料負担|postage_id|integer| null:false| |
|価格|price|integer|null:false | |
|カテゴリー|category_id|integer| null:false|Activehash|
|発送までの日数|shipping_day_id|integer| null:false|Activehash|
|状態|item_status_id|integer| null:false|Activehash|
|発送元地域|prefecture_id|integer| null:false|Activehash|
|販売状況|sold|boolean|||


||user|references |null: false, foreign_key: true||
### Association
- belongs_to :user
- has_many :comments
- has_one :orders

## comments テーブル
|種類|Column|Type|Options|
|:----|:----|:----|:----|
||comment|string|null:false |
||user|references |null: false, foreign_key: true|
||item|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## orders テーブル
種類|Column|Type|Options|備考|
|:----|:----|:----|:----|:----|
|郵便番号|house_number|string|null:false|
|都道府県|prefecture_id|integer|null:false|Activehash|
|市区町村|city|string|null:false| |
|番地|address|string|null:false| |
|建物|building_name|string| | |
|電話番号|phone_number|string|null:false| |
||user_item|references|null: false,foreign_key: true|
### Association
belongs_to :user
belongs_to :item

