# テーブル設計

## users テーブル

| Column             | Type          | Options     |
| ------------------ | ------------- | ----------- |
| email              | string        | null: false |
| encrypted_password | string        | null: false |
| user_name          | string        |             |
| age                | integer       |             |
| gender             | integer/enum  | null: false |
| reviewer_name      | string        | null: false |
| filv_name          | string        | null: false |

### Association

- has_one :reviewer
- has_one :filv


## Reviewers テーブル

| Column        | Type       | Options                        |
| ---------     | ---------  | -----------------------------  |   
| user_id       | references | null: false, foreign_key: true |
| filv_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :reviews
- has_one :filv


## Movies テーブル

| Column      | Type       | Options     |
| --------    | ---------- | ----------- |
| title       | text       | null: false |
| released_at | datetime   | null: false |
| director    | string     |             |

### Association

- has_many :reviews


## Reviews テーブル

| Column      | Type       | Options                        |
| ----------  | ---------- | -----------------------------  |
| reviewer_id | references | null: false, foreign_key: true |
| movie_id    | references | null: false, foreign_key: true |
| filv_id     | references | null: false, foreign_key: true |
| content     | text       | null: false                    |
| e_rating    | integer    |                                |
| l_rating    | integer    |                                |
| c_rating    | integer    |                                |

### Association

- belongs_to :movie
- belongs_to :reviewer
- belongs_to :filv


## Filvs テーブル

| Column       | Type       | Options                        |
| ----------   | ---------- | -----------------------------  |
| user_id      | references | null: false, foreign_key: true |
| reviewer_id  | references | null: false, foreign_key: true |
| review_id    | references | null: false, foreign_key: true |
| avatar_image | text       | null: false                    |
| strength     | integer    | null: false                    |
| intelligence | integer    | null: false                    |
| charisma     | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :reviewer
- has_many :reviews