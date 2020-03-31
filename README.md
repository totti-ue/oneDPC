# README
# oneDPC
![top-img](https://user-images.githubusercontent.com/60683508/77989869-d40b9080-735a-11ea-9e16-91a37f6e74b2.jpg)

アプリ概要
カメラ初心者、アマチュア写真愛好家

## Description
詳細説明

## Features
特徴（頑張った点）

## DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nicakname|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :posts
- has_many :comments

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|image|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|post_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user
