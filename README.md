## usersテーブル名

|Column|Type|Options|
|---------|----|--------|
|nickname |string|null: false   |
|email    |string|null:false,unique: true  |
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|encrypted_password|string|null:false|
|birth_day|date|null:false|


### Association
- has_many :items
- has_many :order

## Itemsテーブル名

|Column|Type|Options|
|---------|----|--------|
|item_title |string|null:false |
|item_text |text|null: false   |
|item_price |integer|null:false   |
|category |string|null:false   |
|condition |string|null:false |
|shipping_fee |string|null:false |
|shipping_area |string|null:false |
|shipping_days |string|null:false |
|sales_commission |string|null:false   |
|profit |string|null:false   |
|user|references|null:false, foreign_key: true |

### Association
- belongs_to :user
- has_one  :order

## Ordersテーブル名

|Column|Type|Options|
|---------|----|--------|
|user   |references|null:false,foreign_key: true   |
|item|references|null:false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## addressesテーブル名

|Column|Type|Options|
|---------|----|--------|
|post_code|integer|null: false   |
|prefectures |text|null: false   |
|municipalities |text|null: false   |
|street_address |text|null: false   |
|building_name |text|null: false   |
|tell|string|null: false   |
|user   |references|null:false,foreign_key: true   |
|item|references|null:false,foreign_key: true|
|order|references|null:false,foreign_key: true|

### Association
- belongs_to :order