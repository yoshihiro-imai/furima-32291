
## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nick_name           | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |
| first_name          | string  | null: false |
| last_name           | string  | null: false |
| first_name_kana     | string  | null: false |
| last_name_kana      | string  | null: false |
| birthday_year       | integer | null: false |
| birthday_month      | integer | null: false |
| birthday_day        | integer | null: false |


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | text       | null: false                    |
| explanation         | text       | null: false                    |
| category            | integer    | null: false                    |
| state               | integer    | null: false                    |
| fee                 | integer    | null: false                    |
| local               | integer    | null: false                    |
| delivery_days       | integer    | null: false                    |
| place               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
| order               | references | null: false, foreign_key: true |

## orders テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| card_id                | integer    | null: false                    |
| expiration_date_year   | integer    | null: false                    |
| expiration_date_month  | integer    | null: false                    |
| security_code          | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |
| item                   | references | null: false, foreign_key: true |
| address                | references | null: false, foreign_key: true |

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture       | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | integer    | null: false                    |
| order            | references | null: false, foreign_key: true |