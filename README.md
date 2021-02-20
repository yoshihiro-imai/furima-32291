
## users テーブル

| Column              | Type    | Options                |
| ------------------- | ------- | ---------------------- |
| name                | string  | null: false            |
| email               | string  | null: false,unique:true|
| encrypted_password  | string  | null: false            |

### Association

has_many : tweets
has_one : shift


## tweet テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| content             | text       | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

has_many   : like_count 
belongs_to : user

### like_count

| like_count          | integer    |                                |
| user                | references | null: false, foreign_key: true |
| tweet               | references | null: false, foreign_key: true |

belongs_to :tweet

## shift テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| day                    | integer    |                                |
| shift_in               | integer    |                                |
| shift_out              | integer    |                                |
| user                   | references | null: false, foreign_key: true |

### Association

belongs_to : user
