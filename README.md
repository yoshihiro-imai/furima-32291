
## users テーブル

| Column              | Type    | Options                |
| ------------------- | ------- | ---------------------- |
| nick_name           | string  | null: false            |
| email               | string  | null: false,unique:true|
| encrypted_password  | string  | null: false            |
| first_name          | string  | null: false            |
| last_name           | string  | null: false            |
| first_name_kana     | string  | null: false            |
| last_name_kana      | string  | null: false            |
| birthday            | date    | null: false            |

### Association

has_many : items
has_many : orders


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| explanation         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| state_id            | integer    | null: false                    |
| fee_id              | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| delivery_days_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

has_one : order
belongs_to : user


## orders テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | null: false, foreign_key: true |
| item                   | references | null: false, foreign_key: true |

### Association

has_one : address
belongs_to : item
belongs_to : user

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

belongs_to : order
