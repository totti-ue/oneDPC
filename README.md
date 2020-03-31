# README
# oneDPC
![top-img](https://user-images.githubusercontent.com/60683508/77989869-d40b9080-735a-11ea-9e16-91a37f6e74b2.jpg)

##### アプリ概要  
カメラ初心者、アマチュア写真愛好家向けのフォトコンテストアプリ。  
**oneDPC**とは **one Day, one Photo, one Contest** の略であり、一日限定フォトコンテスト（投稿枚数は一枚のみ）の意味である。

##### アプリの簡単な仕様書  
ユーザーは毎日日替わりのテーマをもとに画像を１枚投稿。  
投稿へのいいねの数がその日一番多い画像がコンテストの優勝作品となり、翌日の「今日の一枚」として表示される。

## Description
##### 開発環境  
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code



## Features
##### 実装内容  
- haml/SASS記法を使ったマークアップ
- 'devise'というgemを使用したユーザー管理機能
- 画像投稿機能
- 'carrierwave'というgemを使用した画像ファイルアップロード機能
- いいね機能
- お気に入り機能
- フォロー機能
- コメント機能
- 画像検索機能
- ajaxを使用した非同期処理

## DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|avator|text||
|gender|string||
|age|string||
|introduction|text||
### Association
- has_many :posts
- has_many :comments
- has_many :likes
- has_many :liked_posts, through: :likes, source: :post
- has_many :favorites
- has_many :fav_posts, through: :favorites, source: :post
- has_many :relationships
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationships, class_name: 'Relationhip', foreign_key: 'follow_id'
- has_many :followers, through: :reverse_of_relationships, source: :user

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|image|text|null: false|
|message|text||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :liked_posts, through: :likes, source: :user
- has_many :favorites
- has_many :fav_posts, through: :favorites, source: :user
- has_many :post_themes
- has_many :themes, through: :post_themes

## themesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :post_themes
- has_many :posts, through: :post_themes

## post_themesテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|bigint|foreign_key: true|
|theme_id|bigint|foreign_key: true|

### Association
- belongs_to :post
- belongs_to :theme

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|psot_id|integer|foreign_key: true|
### Association
belongs_to :user
belongs_to :post

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|psot_id|integer|foreign_key: true|
### Association
belongs_to :user
belongs_to :post

## relationshipsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|foreign_key: true|
|follow_id|bigint|foreign_key: true|
### Association
belongs_to :user
belongs_to :follow, class_name: 'User'
