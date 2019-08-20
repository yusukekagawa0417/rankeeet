# アプリの名前

 Rankeeet  

## 簡単な説明
 
 Rankeeetは、ランキング形式のアンケートを自由に投稿できるWebアプリです。  
 よく見る【おすすめ〇〇10選】の様なサイトには、そのサイト作成者の意見が色濃く反映されていることがあります。  
 このWebアプリなら様々な人の意見を反映可能です。
 
***デモ***  
https://i.gyazo.com/14c0d3e99b8221471b6799a3f197cb5e.mp4   
https://i.gyazo.com/e9ea93d36e95e9869b055e253a73e361.mp4
https://i.gyazo.com/c09c14a255ecd395dd3c4f194f21f30e.mp4
https://i.gyazo.com/536055fe451e7f5ab1dba2f8a5ff4b8c.mp4
https://i.gyazo.com/0a34d119b9516afa1f9f2a0a7121c944.mp4
https://i.gyazo.com/669ee0dcb49e2190ecc5d2f8dc1a7e6c.mp4
 
 
## 機能
 
 1) アンケート一覧表示機能
 2) アンケート詳細表示機能
 3) ログイン機能（Twitter認証によるログインも可能）  
 4) 各アンケートに対する1人5票までの投票機能  
 5) ランキングのグラフ化機能  
 6) インクリメンタルサーチによるアンケート検索機能  
 7) アンケート作成機能
 8) 自分が作成したアンケートの削除機能  
 9) Twitterでのシェア機能

## 使い方
 
 1) ページの参照にログインは不要です  
 2) アンケート作成、投票にはログインが必要です 
 3) その他は上記***デモ***をご参照ください
 
## DB設計

### usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|default: "", null: false, unique: true, index: true|
|encrypted_password|string|default: "", null: false|
|sign_in_count|integer|default: 0, null: false|
|current_sign_in_at|datetime||
|last_sign_in_at|datetime||
|current_sign_in_ip|string||
|last_sign_in_ip|string||
|uid|integer|index: true|
|name|string|null: false, unique: true|
|provider|string||

#### Association

- has_many :rankings
- has_many :votes

### rankingsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
|user_id|references|foreign_key: true|

#### Association

- has_many :items, dependent: :destroy 
- has_many :votes, dependent: :destroy 
- belongs_to :user

### itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ranking_id|references|foreign_key: true|

#### Association

- has_many :votes, dependent: :destroy 
- belongs_to :ranking

### votesテーブル

|Column|Type|Options|
|------|----|-------|
|quantity|string||
|user_id|references|foreign_key: true|
|ranking_id|references|foreign_key: true|
|item_id|references|foreign_key: true|


#### Association

- belongs_to :user
- belongs_to :ranking
- belongs_to :item

## テスト
 
 1) バリデーション、メソッドの単体テスト実施  
 2) ログインの有無による動作に関する統合テスト実施  
 
## デプロイ
 
 HEROKU  
 https://rankeeet.herokuapp.com/
 

## 作者
 
 香川裕輔  
 y_kagawa0417@yahoo.co.jp  
 https://twitter.com/pochan96493320

## 制作日

 2019/7/19  
 （その後、随時更新中）

## 転載の可否

 可
 
## 著作権および免責事項

 本アプリはフリーです。個人／団体／社内利用を問わず、ご自由にお使い下さい。  
 なお、著作権は作者である香川裕輔が保有しています。  
 このアプリを使用したことによって生じたすべての障害・損害・不具合等に関しては、  
 私と私の関係者および私の所属するいかなる団体・組織とも、一切の責任を負いません。  
 各自の責任においてご使用ください。


--以上--
