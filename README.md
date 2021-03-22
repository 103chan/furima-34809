## usersテーブル

| Column     | Type       | Options      |
| ---------- | ---------- | ------------ |
| nickname   | string     | null: false  |
| email      | string     | null: false  |
| password   | string     | null: false  |


### Association

- has_many :prototypes
- has_many :comments

## prototypesテーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| title       | string     | null: false |
| catch_copy  | text       | null: false |
| concept     | text       | null: false |
| user        | references | null: false |

### Association

- has_many :comments

## commentsテーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| text        | text       | null: false |
| user        | references |             |
| prototype   | references |             |

### Association

- belongs_to :prototype
- belongs_to :user
