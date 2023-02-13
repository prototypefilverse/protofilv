# アプリケーション名
Filverse(prototype)

# アプリケーション概要



# URL
https://protofilv.onrender.com


# テスト用アカウント

# 利用方法
## 映画レビュー
映画のレビューを投稿できます。
## レビューへの評価がアバターに反映


# 制作した背景

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1EmU3Xp_ODezRBASj9ChyZa917aQ1k6SZd6EMIfQqMkE)

# 実装した機能についての画像、およびその説明

# 実装予定の機能

# ER図

# 画面偏移図

# テーブル設計

## users テーブル

| Column             | Type          | Options     |
| ------------------ | ------------- | ----------- |
| email              | string        | null: false |
| encrypted_password | string        | null: false |
| age                | integer       |             |
| gender             | integer,enum  | null: false |
| reviewer_name      | string        | null: false |
| filv_name          | string        | null: false |

### Association

- has_one :reviewer
- has_one :filv


## Reviewers テーブル

| Column     | Type       | Options           |
| ---------  | ---------  | ----------------  |   
| user_id    | references | foreign_key: true |

### Association

- belongs_to :user
- has_one    :filv
- has_many   :reviews


## Movies テーブル

| Column      | Type       | Options     |
| --------    | ---------- | ----------- |
| title       | text       | null: false |
| release_at  | datetime   | null: false |
| director    | string     |             |

### Association

- has_many :reviews


## Reviews テーブル

| Column         | Type       | Options                        |
| ----------     | ---------- | -----------------------------  |
| reviewer_id    | references | null: false, foreign_key: true |
| movie_id       | references | null: false, foreign_key: true |
| review_title   | string     | null: false                    |
| review_content | text       | null: false                    |
| e_rating       | integer    | null: false                    |
| l_rating       | integer    | null: false                    |
| c_rating       | integer    | null: false                    |

### Association

- belongs_to :movie
- belongs_to :reviewer


## Filvs テーブル

| Column       | Type       | Options                        |
| ----------   | ---------- | -----------------------------  |
| user_id      | references | null: false, foreign_key: true |
| reviewer_id  | references | null: false, foreign_key: true |
| strength     | integer    | null: false                    |
| intelligence | integer    | null: false                    |
| charisma     | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :reviewer

# 開発環境
## 使用しているバージョン等

# ローカルでの動作方法


# 工夫したポイント
