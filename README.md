## usersテーブル

| Column              | Type       | Options      |
| ------------------- | ---------- | ------------ |
| nickname            | string     | null: false  |
| family_name         | string     | null: false  |
| first_name          | string     | null: false  |
| family_name_kana    | string     | null: false  |
| first_name_kana     | string     | null: false  |
| email               | string     | unique: true |
| encrypted_password  | string     | null: false  |
| birthday_year       | string     | null: false  |
| birthday_month      | string     | null: false  |
| birthday_day        | string     | null: false  |

### Association

- has_one : items
- has_many : orders

## itemsテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| item            | string     | null: false |
| description     | text       | null: false |
| category        | string     | null: false |
| condition       | string     | null: false |
| delivery_fee    | string     | null: false |
| shipment_source | string     | null: false |
| days_to_ship    | string     | null: false |
| price           | references | null: false |
| user            | references | null: false |


### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| user        | references | null: false |
| item        | references | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressテーブル

| Column      | Type       | Options      |
| ----------- | ---------- | ------------ |
| post_code   | string     | null: false  |
| prefecture  | string     | null: false  |
| city        | string     | null: false  |
| address     | text       | null: false  |
| building    | text       | null: false  |
| telephone   | references | unique: true |

### Association

- belongs_to :order
