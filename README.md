## usersテーブル名

|Column|Type|Options|
|---------|----|--------|
|nickname |string|null: false   |
|email    |string|null:false   |
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|encrypted_password|string|null:false|
|birth_day|date|null:false|


### Association
- has_many :items
- has_many :comments
- has_one  :order

## itemsテーブル名

|Column|Type|Options|
|---------|----|--------|
|item_title |string|null:false |
|item_text |text|null: false   |
|item_price |integer|null:false   |
|user|references|null:false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_one  :order

## commentsテーブル名

|Column|Type|Options|
|---------|----|--------|
|comment_text |string|null: false   |
|user   |references|null:false,foreign_key: true   |
|item|references|null:false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to item

## addressesテーブル名

|Column|Type|Options|
|---------|----|--------|
|post_code|integer|null: false   |
|address |text|null: false   |
|tell|string|null: false   |
|user   |references|null:false,foreign_key: true   |
|item|references|null:false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :comment