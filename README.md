## usersテーブル

| Column              | Type     | Options                   |
| ------------------- | -------- | ------------------------- |
| nickname            | string   | null: false               |
| family_name         | string   | null: false               |
| first_name          | string   | null: false               |
| family_name_kana    | string   | null: false               |
| first_name_kana     | string   | null: false               |
| email               | string   | unique: true, null: false |
| encrypted_password  | string   | null: false               |
| birthday            | date     | null: false               |

### Association

- has_many : item
- has_many : orders

## itemsテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| item_name       | string     | null: false |
| description     | text       | null: false |
| category_id     | integer    | null: false |
| condition_id    | integer    | null: false |
| delivery_fee_id | integer    | null: false |
| prefecture_id   | integer    | null: false |
| days_to_ship_id | integer    | null: false |
| price           | integer    | null: false |
| user            | references | null: false |


### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| user_id     | references | null: false |
| item_id     | references | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressテーブル

| Column        | Type       | Options      |
| --------------| ---------- | ------------ |
| post_code     | string     | null: false  |
| prefecture_id | integer    | null: false  |
| city          | string     | null: false  |
| address       | string     | null: false  |
| building      | string     |              |
| telephone     | integer    | null: false  |
| user_id       | references | null: false  |
| item_id       | references | null: false  |

### Association

- belongs_to :order
