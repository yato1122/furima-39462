## usersテーブル名

|Column|Type|Options|
|---------|----|--------|
|nickname |string|null: false   |
|email    |string|null:false   |
|first_name|string|null:false|
|last_name|string|null:false|
|encrypted_password|string|null:false|
|birth_year|string|null:false|
|birth_month|string|null:false|
|birth_day|string|null:false|

### Association
- has_many :item
- has_many :comment
- has_one  :order

## itemsテーブル名

|Column|Type|Options|
|---------|----|--------|
|item_text |string|null: false   |
|item_price   |string|null:false   |
|image|string|null:false|
|user|references|null:false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comment
- has_one  :order

## commentsテーブル名

|Column|Type|Options|
|---------|----|--------|
|comment_text |string|null: false   |
|user   |references|null:false,foreign_key: true   |
|item|references|null:false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :comment

## ordersテーブル名

|Column|Type|Options|
|---------|----|--------|
|addres |string|null: false   |
|user   |references|null:false,foreign_key: true   |
|item|references|null:false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :comment