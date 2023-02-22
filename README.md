# アプリケーション名
FilVerse(フィルバース) 試作

# アプリケーション概要
映画をレビューすると勇者が強くなるアプリ  
<img src="https://i.gyazo.com/0f770d2633dcc5afc6077b2da1ab0e70.jpg" width="70%">  
①映画レビュー  
・映画のレビューを投稿できる。  
・他のユーザーに自分のレビューが評価され、自分は他のユーザーのレビューを評価できる。  
②レビューへの評価がアバターに反映  
・自分のレビューが評価されると勇者アバターのパラメータが上昇する。  
・誰かのレビューを評価した側も一定でパラメータが上がる。  
・アバターは別の世界で戦ったり、交流をしたりする。

# URL
https://protofilv.onrender.com  

# テスト用アカウント
Basic認証 ID：mrkw  
Basic認証 PASS：0903  
メールアドレス：sample@gmail.com  
メールアドレス：sample2@gmail.com  
パスワード：123abc  

# 利用方法 
▼ログイン・ログアウト
1. 未ログイントップページのヘッダーまたは中央にある「ログイン」ボタンを押す
2. ログイン画面に偏移するのでeメールとパスワードを入力して「Login」ボタンを押すとログインする
3. ログアウトするにはヘッダーにある「ログアウト」ボタンを押す

▼レビュー閲覧 
1. ログイン時トップページの「映画一覧・検索」ボタンを押す
2. 映画のタイトル一覧画面に偏移するので各タイトルをクリックする
3. トップページに偏移し、クリックしたタイトルのレビューが表示されている  

▼レビュー投稿
1. レビュー表示域のタイトル情報の下にある「レビュー投稿」ボタンを押す
2. 該当映画のレビュー投稿画面に偏移するので、内容を記入し、「投稿」ボタンを押す  

▼マイレビュー管理（閲覧・削除）
1. ヘッダーの「マイページ」ボタンを押す
2. 自分のレビュー一覧画面に偏移するので、削除したいレビューは右下の「削除」ボタンを押す

▼レビュー評価（アバターへの反映）
1. レビュー表示域の（自分以外のレビューの）下部にあるプルダウンから数値を選択し投稿する
2. レビューへの評価はその投稿をしたユーザーのアバターのパラメータに反映される

### (未実装)  
▼アバターをフィールドで活躍させる
1. アバターはパラメータが上がることでバトルフィールド等で活躍できる
 

# 制作した背景
映画のレビューサイトやアプリは沢山あるものの、レビューの閲覧は、繋がっているユーザーや、最初にいいねが沢山ついたものなどに偏り、優れたレビューでも平等に評価されず埋もれることが多いのではと考えていた。  

その問題を解決するためには、ユーザー同士のつながりをなくし、表示を一律ランダムにすることが必要だと考えた。  

しかしその場合、「レビュアーのモチベーションが保てない」という別の問題が発生すると考えられる。  

そこで、前述の「ユーザー同士のつながりをなくし表示を一律ランダムにする機能」と同時に、「レビューへの評価機能」および「その評価結果をアバターのパラメータに反映させる」機能を実装することにした。これにより、ユーザーのモチベーションを保ちながらも、レビューの公平性を保つことができると考えた。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1EmU3Xp_ODezRBASj9ChyZa917aQ1k6SZd6EMIfQqMkE)

# 実装した機能についての画像、およびその説明  
ログイン前のページ   
・新規登録できる  
・ログインできる  
<img src="https://i.gyazo.com/80e0d3fd64518ae9f94381fcf397532c.png" width="50%">

ログイン後のページ  
・映画選択  
・レビュー一覧  
・投稿画面へ偏移  
<img src="https://i.gyazo.com/54a48844c90f92f926ab07cb165d8abb.gif" width="50%">  

・投稿したら投稿画面ボタンは消える  
・マイページに自分のレビュー一覧  
・レビュー削除  
<img src="https://i.gyazo.com/143f5c707e4d0fc129081f075d4762eb.gif" width="50%">  

・他のレビュアーのレビューに３つの項目を1〜5点を選択して評価投稿する  
・評価されたレビューを投稿したユーザーのアバターのパラメータが上がる  
<img src="https://i.gyazo.com/2daa3e3bcc896eb5ffd8945571ba4987.gif" width="50%">

# 実装予定の機能
・映画検索機能  
・削除の際の警告機能  
・他ユーザーを評価した時に自分のアバターのパラメータが上がる機能   
・アバターが活躍するフィールドの実装

# 工夫したポイント
 フィルバースというアプリ名はフィルムとメタバースからとっている。映画レビューという行為が全く別の世界と連動していることを視覚的に示したかったので、映画レビュー関連の画面とパラメータを持ったアバターのある画面は二分割で同時表示するようにした。

# 開発環境
- ruby 2.6.5
- Rails 6.0.6.1

# ローカルでの動作方法
% git clone https://github.com/prototypefilverse/protofilv.git  
% cd protofilv  
% bundle install  
% rails db:create  
% rails db:migrate  
% yarn install  



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

- has_one :reviewer
- has_one :filv
- has_many :user_ratings
- has_many :ratings, through: :user_ratings


## Reviewers テーブル

| Column     | Type       | Options           |
| ---------  | ---------  | ----------------  |   
| user_id    | references | foreign_key: true |

- belongs_to :user
- has_one    :filv
- has_many   :reviews


## Filvs テーブル

| Column       | Type       | Options                        |
| ----------   | ---------- | -----------------------------  |
| user_id      | references | null: false, foreign_key: true |
| reviewer_id  | references | null: false, foreign_key: true |
| strength     | integer    | null: false                    |
| intelligence | integer    | null: false                    |
| charisma     | integer    | null: false                    |

- belongs_to :user
- belongs_to :reviewer


## Movies テーブル

| Column      | Type       | Options     |
| --------    | ---------- | ----------- |
| title       | text       | null: false |
| release_at  | datetime   | null: false |
| director    | string     |             |

- has_many :reviews


## Reviews テーブル

| Column         | Type       | Options                        |
| ----------     | ---------- | -----------------------------  |
| reviewer_id    | references | null: false, foreign_key: true |
| movie_id       | references | null: false, foreign_key: true |
| review_title   | string     | null: false                    |
| review_content | text       | null: false                    |

- belongs_to :movie
- belongs_to :reviewer
- has_many :ratings

## Ratings テーブル

| Column      | Type       | Options                        |
| ----------  | ---------- | -----------------------------  |
| reviewer_id | references | null: false, foreign_key: true |
| e_rating    | integer    | null: false                    |
| l_rating    | integer    | null: false                    |
| c_rating    | integer    | null: false                    |

- belongs_to :review
- has_many :user_ratings
- has_many :users, through: :user_ratings

## UserRatings テーブル

| Column      | Type       | Options                        |
| ----------  | ---------- | -----------------------------  |
| user_id     | references | null: false, foreign_key: true |
| rating_id   | references | null: false, foreign_key: true |

 - belongs_to :user
 - belongs_to :rating