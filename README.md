## Usersテーブル

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
- has_many :orders

## Itemsテーブル

|Column|Type|Options|
|---------|----|--------|
|item_title |string|null:false |
|item_text |text|null: false   |
|item_price |integer|null:false   |
|category_id |integer|null:false   |
|condition_id |integer|null:false |
|shipping_fee_id|integer|null:false |
|shipping_area_id |integer|null:false |
|shipping_days_id |integer|null:false |
|user|references|null:false, foreign_key: true |

### Association
- belongs_to :user
- has_one  :order

## Ordersテーブル

|Column|Type|Options|
|---------|----|--------|
|user   |references|null:false,foreign_key: true   |
|item|references|null:false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one  :address

## Addressesテーブル

|Column|Type|Options|
|---------|----|--------|
|post_code|string|null: false   |
|shipping_area_id |integer|null: false   |
|municipalities |string|null: false   |
|street_address |string|null: false   |
|building_name |string|
|tell|string|null: false   |
|order|references|null:false,foreign_key: true|

### Association
- belongs_to :order