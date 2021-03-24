# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | string | null: false |

### Association

- has_many : purchases
- has_many : items

## items テーブル

| Column                   | Type   | Options     |
| ------------------------ | ------ | ----------- |
| name                     | text   | null: false |
| explain                  | text   | null: false | 
| category                 | string | null: false |
| item_status              | string | null: false |
| shipping_fee_status      | string | null: false |
| shipping_fee_destination | string | null: false |
| shipping_fee_days        | string | null: false |
| cost                     | string | null: false |
| user                     | string | null: false |

### Association

- belongs_to :user
- has_one :purchase

## orders テーブル

| Column        | Type   | Options     |
| ------------- | -------| ----------- |
| post_code     | string | null: false |
| prefecture    | string | null: false |
| city          | string | null: false |
| address       | string | null: false |
| building_name | string | null: false |
| phone_number  | string | null: false |
### Association

- belongs_to :purchase

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :item